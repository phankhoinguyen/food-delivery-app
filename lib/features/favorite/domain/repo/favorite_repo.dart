import 'package:food_delivery/features/favorite/domain/entities/favorite_model.dart';
import 'package:food_delivery/features/home/domain/entities/product_model.dart';

abstract class FavoriteRepo {
  Future<List<FavoriteModel>> getFavoriteList();
  Future<void> addToList(FavoriteModel item);
  Future<void> removeFromList(FavoriteModel item);
  Future<List<ProductModel>> getProductById(List<String> id);
}
