import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/features/home/domain/repo/product_repo.dart';
import 'package:food_delivery/features/home/presentation/cubits/product_state.dart';

class ProductCubits extends Cubit<ProductState> {
  final ProductRepo productRepo;
  ProductCubits({required this.productRepo}) : super(ProductInitial());

  Future<void> getProduct() async {
    emit(ProductLoading());
    try {
      final listProduct = await productRepo.getProduct();
      print(listProduct);
      emit(ProductSuccess(listProducts: listProduct));
    } catch (e) {
      emit(ProductError(msg: e.toString()));
    }
  }

  Future<void> getProductByCate(String category) async {
    emit(ProductLoading());
    try {
      final listProduct = await productRepo.getProductByCate(category);
      emit(ProductSuccess(listProducts: listProduct));
    } catch (e) {
      emit(ProductError(msg: e.toString()));
    }
  }
}
