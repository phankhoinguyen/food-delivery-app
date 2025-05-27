import 'package:food_delivery/features/cart/domain/entities/cart_model.dart';

abstract class CartState {}

class CartInitial extends CartState {}

class CartLoaded extends CartState {
  final List<CartModel> listCart;
  CartLoaded(this.listCart);
}

class CartLoading extends CartState {}

class CartAddSuccess extends CartState {}

class CartChangeQuantity extends CartState {}

class CartError extends CartState {
  final String msg;
  CartError(this.msg);
}
