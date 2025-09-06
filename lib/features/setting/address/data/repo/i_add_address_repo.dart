import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_delivery/core/constants/api_constants.dart';
import 'package:food_delivery/core/constants/uid.dart';
import 'package:food_delivery/core/failure/failure.dart';
import 'package:food_delivery/features/setting/address/domain/repo/add_address_repo.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:location/location.dart';
import 'package:logger/logger.dart';

import '../../domain/entities/place_prediction.dart';

@LazySingleton(as: AddressRepo)
class AddressRepositoryImpl implements AddressRepo {
  final logger = Logger();
  final http.Client httpClient;
  final _db = FirebaseFirestore.instance;
  final _currentUser = FirebaseAuth.instance.currentUser;

  AddressRepositoryImpl(this.httpClient);

  @override
  Future<Either<Failure, List<PlacePrediction>>> searchPlaces({
    required String query,
    List<String>? regionCodes,
    String? languageCode,
  }) async {
    try {
      // Tạo request body
      final requestBody = json.encode({
        'input': query,
        'includedRegionCodes': regionCodes ?? ApiConstants.countryCode,
        'languageCode': languageCode ?? ApiConstants.languageCode,
      });

      // Gọi API
      final response = await httpClient.post(
        Uri.parse(ApiConstants.placesAutocomplete),
        headers: ApiConstants.headers,
        body: requestBody,
      );
      // Xử lý response
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body) as Map<String, dynamic>;
        // Parse JSON trực tiếp
        final suggestions = responseData['suggestions'] as List<dynamic>? ?? [];
        final predictions =
            suggestions.map<PlacePrediction>((suggestion) {
              final place =
                  suggestion['placePrediction'] as Map<String, dynamic>;
              final formatName =
                  place['structuredFormat'] as Map<String, dynamic>;
              final mainText = formatName['mainText'] as Map<String, dynamic>;
              final secondaryText =
                  formatName['secondaryText'] as Map<String, dynamic>;

              return PlacePrediction(
                uid: '',
                placeId: place['placeId']!,
                displayName: mainText['text'] as String,
                formattedAddress: secondaryText['text'] as String,
              );
            }).toList();
        return Right(predictions);
      } else {
        return Left(
          Failure.message('Failed to search places: ${response.statusCode}'),
        );
      }
    } catch (e) {
      return Left(Failure.message(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> getPlaceDetails({
    required String placeId,
  }) async {
    try {
      // URL cho place details
      final response = await http.get(
        Uri.parse(ApiConstants.buildGeocodingUrl(placeId)),
        headers: ApiConstants.mapsHeaders,
      );
      // Xử lý response
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body) as Map<String, dynamic>;

        final results = responseData['results'] as List<dynamic>;
        final geometry = results[0]['geometry'];
        final location = geometry['location'];
        return Right({'lat': location['lat'], 'long': location['lng']});
      } else {
        return Left(
          Failure.message(
            'Failed to get place details: ${response.statusCode}',
          ),
        );
      }
    } catch (e) {
      return Left(Failure.message('Unexpected error: $e'));
    }
  }

  @override
  Future<Either<Failure, PlacePrediction>> saveAddress({
    required PlacePrediction place,
  }) async {
    try {
      place = place.copyWith(uid: uuid.v4());
      await _db
          .collection('user')
          .doc(_currentUser!.uid)
          .collection('address')
          .doc()
          .set(place.toJson());
      return Right(place);
    } catch (e) {
      return Left(Failure.message('Failed to save address: $e'));
    }
  }

  @override
  Future<Either<Failure, PlacePrediction>> getCurrentLotion() async {
    // final PlacePrediction place;
    try {
      Location location = Location();
      bool serviceEnabled;
      PermissionStatus permissionGranted;
      LocationData locationData;

      // 1. Kiểm tra dịch vụ định vị
      serviceEnabled = await location.serviceEnabled();
      if (!serviceEnabled) {
        serviceEnabled = await location.requestService();
        if (!serviceEnabled) {
          return const Left(
            Failure.message('Dịch vụ định vị chưa được bật. Vui lòng bật GPS.'),
          );
        }
      }

      // 2. Kiểm tra quyền truy cập
      permissionGranted = await location.hasPermission();
      if (permissionGranted == PermissionStatus.denied) {
        permissionGranted = await location.requestPermission();
        if (permissionGranted != PermissionStatus.granted) {
          return const Left(
            Failure.message('Quyền truy cập vị trí bị từ chối'),
          );
        }
      }

      // 3. Lấy vị trí hiện tại
      locationData = await location.getLocation();
      final lat = locationData.latitude;
      final lng = locationData.longitude;

      if (lat == null || lng == null) {
        return const Left(Failure.message('Không thể lấy được tọa độ vị trí'));
      }
      final url = ApiConstants.currentLocationUrl(
        lat.toString(),
        lng.toString(),
      );
      final response = await http.get(
        Uri.parse(url),
        headers: ApiConstants.mapsHeaders,
      );
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body) as Map<String, dynamic>;
        final results = responseData['results'] as List<dynamic>;
        final fullAddress = results[0]['formatted_address'] as String;
        final idAddress = results[0]['place_id'] as String;

        final parts = fullAddress.split(', ');
        final mainText = parts[0];
        final secondaryText = parts.sublist(1).join(', ');

        final place = PlacePrediction(
          uid: '',
          placeId: idAddress,
          displayName: mainText,
          formattedAddress: secondaryText,
          lat: lat.toString(),
          long: lng.toString(),
        );

        return Right(place);
      }

      return const Left(
        Failure.message('Không thể lấy được thông tin địa chỉ'),
      );
    } catch (e) {
      return Left(Failure.message('Lỗi khi lấy vị trí hiện tại: $e'));
    }
  }

  @override
  Future<Either<Failure, PlacePrediction>> updateAddress({
    required PlacePrediction place,
  }) async {
    // if (place.isDefault == true) {
    //   await resetDefault();
    // }
    try {
      logger.w(place);
      final querySnapshot =
          await _db
              .collection('user')
              .doc(_currentUser!.uid)
              .collection('address')
              .where('uid', isEqualTo: place.uid)
              .get();
      logger.w(querySnapshot.docs);
      await querySnapshot.docs.first.reference.update(place.toJson());

      return Right(place);
    } catch (e) {
      return Left(Failure.message('Failed to update address: $e'));
    }
  }

  Future<void> resetDefault() async {
    try {
      final query =
          await _db
              .collection('user')
              .doc(_currentUser!.uid)
              .collection('address')
              .where('isDefault', isEqualTo: true)
              .get();
      query.docs.first.reference.update({'isDefault': false});
    } catch (e) {}
  }
}
