import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_delivery/features/auth/domain/entities/app_user.dart';
import 'package:food_delivery/features/cart/domain/entities/cart_model.dart';
import 'package:food_delivery/features/cart/domain/repo/cart_repo.dart';

class CartRepoFirestore implements CartRepo {
  final _db = FirebaseFirestore.instance;
  final AppUser user;
  CartRepoFirestore(this.user);
  @override
  Future<void> addToCart(CartModel item) async {
    await _db
        .collection('cart')
        .doc(user.uid)
        .collection('product')
        .doc(item.id)
        .set(item.toJson());
  }

  @override
  Future<void> removeFromCart(CartModel item) async {
    await _db
        .collection('cart')
        .doc(user.uid)
        .collection('product')
        .doc(item.id)
        .delete();
  }

  @override
  Future<List<CartModel>> getCartList() async {
    try {
      final ref =
          await _db
              .collection('cart')
              .doc(user.uid)
              .collection('product')
              .get();

      final listCart =
          ref.docs.map((doc) {
            return CartModel.fromJson(doc.data());
          }).toList();
      return listCart;
    } catch (e) {
      return [];
    }
  }

  @override
  Future<void> decreaseQuantity(CartModel item) async {
    final ref = _db
        .collection('cart')
        .doc(user.uid)
        .collection('product')
        .doc(item.id);
    final doc = await ref.get();
    if (doc.exists) {
      final item = doc.data();
      int currentQuantity = item?['quantity'] ?? 1;
      if (currentQuantity > 1) {
        currentQuantity -= 1;
      }
      await ref.update({'quantity': currentQuantity});
    }
  }

  @override
  Future<void> increaseQuantity(String newId, int quantity) async {
    final ref = _db
        .collection('cart')
        .doc(user.uid)
        .collection('product')
        .doc(newId);
    final doc = await ref.get();
    if (doc.exists) {
      final item = doc.data();
      int currentQuantity = item?['quantity'];
      int newQuantity = currentQuantity + quantity;
      await ref.update({'quantity': newQuantity});
    }
  }
}
