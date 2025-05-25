import 'package:food_delivery/features/home/domain/entities/product_model.dart';

abstract class ProductRepo {
  Future<List<ProductModel>> getProduct();
  Future<List<ProductModel>> getProductByCate(String category);
}
