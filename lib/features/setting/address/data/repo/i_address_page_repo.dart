import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_delivery/features/setting/address/domain/entities/place_prediction.dart';
import 'package:food_delivery/features/setting/address/domain/repo/address_page_repo.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@LazySingleton(as: AddressPageRepo)
class IAddressPageRepo implements AddressPageRepo {
  final _db = FirebaseFirestore.instance;
  final _currentUser = FirebaseAuth.instance.currentUser;
  final logger = Logger();
  @override
  Future<List<PlacePrediction>> getListAddress() async {
    try {
      final result =
          await _db
              .collection('user')
              .doc(_currentUser!.uid)
              .collection('address')
              .orderBy('createdAt', descending: true)
              .get();
      final listAddress =
          result.docs.map((e) {
            return PlacePrediction.fromJson(e.data());
          }).toList();
      listAddress.sort((a, b) {
        if (a.isDefault == true) {
          return 1;
        }
        if (b.isDefault == true) {
          return -1;
        }
        return 0;
      });
      return listAddress;
    } catch (e) {
      rethrow;
    }
  }
}
