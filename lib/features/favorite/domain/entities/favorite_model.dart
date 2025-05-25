import 'package:food_delivery/features/home/domain/entities/product_model.dart';

class FavoriteModel {
  final String id;
  final String name;
  final String category;
  final double price;
  final String imgUrl;

  FavoriteModel({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.imgUrl,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'category': category,
      'price': price,
      'imgUrl': imgUrl,
    };
  }

  factory FavoriteModel.fromProduct(ProductModel product) {
    return FavoriteModel(
      id: product.id,
      name: product.name,
      category: product.category,
      price: product.price,
      imgUrl: product.imageCard,
    );
  }

  factory FavoriteModel.fromJson(Map<String, dynamic> json) {
    return FavoriteModel(
      id: json['id'],
      name: json['name'],
      category: json['category'],
      price: json['price'],
      imgUrl: json['imgUrl'],
    );
  }
}
