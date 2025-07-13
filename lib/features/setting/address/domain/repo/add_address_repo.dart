import 'package:food_delivery/core/failure/failure.dart';
import 'package:food_delivery/features/setting/address/domain/entities/place_prediction.dart';
import 'package:dartz/dartz.dart';

abstract class AddressRepo {
  Future<Either<Failure, List<PlacePrediction>>> searchPlaces({
    required String query,
    List<String>? regionCodes,
    String? languageCode,
  });

  /// Get place details bằng place ID
  /// Return PlaceDetails hoặc Failure
  Future<Either<Failure, Map<String, dynamic>>> getPlaceDetails({
    required String placeId,
  });

  Future<Either<Failure, PlacePrediction>> saveAddress({
    required PlacePrediction place,
  });

  Future<Either<Failure, PlacePrediction>> updateAddress({
    required PlacePrediction place,
  });

  Future<Either<Failure, PlacePrediction>> getCurrentLotion();
}
