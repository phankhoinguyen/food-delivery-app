import 'package:food_delivery/features/cart/domain/entities/cart_model.dart';
import 'package:food_delivery/features/setting/address/domain/entities/place_prediction.dart';

abstract class CartEvent {}

class GetCartList extends CartEvent {}

class AddToCart extends CartEvent {
  final CartModel item;
  final int quantity;

  AddToCart(this.item, this.quantity);
}

class RemoveFromCart extends CartEvent {
  final CartModel item;

  RemoveFromCart(this.item);
}

class IncreaseQuantity extends CartEvent {
  final String itemId;
  final int quantity;

  IncreaseQuantity(this.itemId, this.quantity);
}

class DecreaseQuantity extends CartEvent {
  final CartModel item;

  DecreaseQuantity(this.item);
}

class ChooseAddress extends CartEvent {
  final PlacePrediction place;

  ChooseAddress(this.place);
}
