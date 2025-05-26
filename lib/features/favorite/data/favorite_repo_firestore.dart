import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_delivery/features/auth/domain/entities/app_user.dart';
import 'package:food_delivery/features/favorite/domain/entities/favorite_model.dart';
import 'package:food_delivery/features/favorite/domain/repo/favorite_repo.dart';
import 'package:food_delivery/features/home/domain/entities/product_model.dart';

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
    final listItem =
        ref.docs.map((item) {
          return FavoriteModel.fromJson(item.data());
        }).toList();
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

  @override
  Future<List<ProductModel>> getProductById(List<String> id) async {
    final ref = await _db.collection('products').where('id', whereIn: id).get();
    final listProductByid =
        ref.docs.map((doc) {
          return ProductModel.fromJson(doc.data());
        }).toList();
    return listProductByid;
  }
}
