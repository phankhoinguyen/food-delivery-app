import 'package:food_delivery/features/home/domain/entities/category_model.dart';

abstract class CategoryState {}

//initial
class CateIntitial extends CategoryState {}

// loading
class CateLoading extends CategoryState {}

class CateSuccess extends CategoryState {
  final List<CategoryModel> listCategories;
  CateSuccess({required this.listCategories});
}

class CateError extends CategoryState {
  final String msg;
  CateError({required this.msg});
}
