import 'package:food_delivery/features/home/domain/entities/product_model.dart';

class CartModel {
  final String id;
  final String name;
  final int quantity;
  final double price;
  final String imgUrl;

  CartModel({
    required this.imgUrl,
    required this.id,
    required this.name,
    required this.quantity,
    required this.price,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'quantity': quantity,
      'price': price,
      'imgUrl': imgUrl,
    };
  }

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      quantity: json['quantity'] ?? 0,
      price: json['price'] ?? 0,
      imgUrl: json['imgUrl'] ?? '',
    );
  }

  factory CartModel.fromProduct(ProductModel product, int quantity) {
    return CartModel(
      id: product.id,
      name: product.name,
      price: product.price,
      imgUrl: product.imageCard,
      quantity: quantity,
    );
  }
}
