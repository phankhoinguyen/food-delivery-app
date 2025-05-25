import 'package:food_delivery/features/home/domain/entities/product_model.dart';

abstract class ProductState {}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductSuccess extends ProductState {
  final List<ProductModel> listProducts;
  ProductSuccess({required this.listProducts});
}

class ProductError extends ProductState {
  final String msg;
  ProductError({required this.msg});
}
