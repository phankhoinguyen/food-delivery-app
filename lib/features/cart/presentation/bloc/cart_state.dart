import 'package:food_delivery/features/cart/domain/entities/cart_model.dart';
import 'package:equatable/equatable.dart';

abstract class CartState extends Equatable {
  const CartState({this.cartItems = const []});

  final List<CartModel> cartItems;

  double get totalPrice {
    return cartItems.fold(
      0,
      (total, item) => total + (item.price * item.quantity),
    );
  }

  CartState copyWith({List<CartModel>? cartItems}) {
    return CartInitial(cartItems: cartItems ?? this.cartItems);
  }

  @override
  List<Object?> get props => [cartItems];
}

class CartInitial extends CartState {
  const CartInitial({super.cartItems});

  @override
  CartInitial copyWith({List<CartModel>? cartItems}) {
    return CartInitial(cartItems: cartItems ?? this.cartItems);
  }

  @override
  List<Object?> get props => [cartItems];
}

class CartLoading extends CartState {
  const CartLoading();
}

class CartLoaded extends CartState {
  const CartLoaded();
}

class CartAddSuccess extends CartState {
  const CartAddSuccess();
}

class CartChangeQuantity extends CartState {
  const CartChangeQuantity();
}

class CartError extends CartState {
  final String message;

  const CartError(this.message);

  @override
  List<Object?> get props => [message];
}
