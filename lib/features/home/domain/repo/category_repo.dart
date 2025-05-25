import 'package:food_delivery/features/home/domain/entities/category_model.dart';

abstract class CategoryRepo {
  Future<List<CategoryModel>> getCategory();
}
