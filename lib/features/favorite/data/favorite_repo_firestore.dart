import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_delivery/features/auth/domain/entities/app_user.dart';
import 'package:food_delivery/features/favorite/domain/entities/favorite_model.dart';
import 'package:food_delivery/features/favorite/domain/repo/favorite_repo.dart';

class FavoriteRepoFirestore implements FavoriteRepo {
  FavoriteRepoFirestore(this.appUser);
  final _db = FirebaseFirestore.instance;
  final AppUser appUser;
  @override
  Future<void> addToList(FavoriteModel item) async {
    await _db
        .collection('favorite')
        .doc(appUser.uid)
        .collection('products')
        .doc(item.id)
        .set(item.toJson());
  }

  @override
  Future<List<FavoriteModel>> getFavoriteList() async {
    final ref =
        await _db
            .collection('favorite')
            .doc(appUser.uid)
            .collection('products')
            .get();
    print(ref);
    final listItem =
        ref.docs.map((item) {
          return FavoriteModel.fromJson(item.data());
        }).toList();
    print(listItem);
    return listItem;
  }

  @override
  Future<void> removeFromList(FavoriteModel item) async {
    await _db
        .collection('favorite')
        .doc(appUser.uid)
        .collection('products')
        .doc(item.id)
        .delete();
  }
}
