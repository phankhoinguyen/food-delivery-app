import 'package:food_delivery/features/cart/domain/entities/cart_model.dart';

abstract class CartRepo {
  Future<List<CartModel>> getCartList();
  Future<void> addToCart(CartModel item);
  Future<void> removeFromCart(CartModel item);
  Future<void> increaseQuantity(String newId, int quantity);
  Future<void> decreaseQuantity(CartModel item);
}
