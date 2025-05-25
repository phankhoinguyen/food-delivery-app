import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/features/home/domain/entities/category_model.dart';
import 'package:food_delivery/features/home/domain/repo/category_repo.dart';
import 'package:food_delivery/features/home/presentation/cubits/category_state.dart';

class CategoryCubits extends Cubit<CategoryState> {
  final CategoryRepo categoryRepo;
  CategoryCubits({required this.categoryRepo}) : super(CateIntitial());

  Future<List<CategoryModel>> getListCategory() async {
    try {
      emit(CateLoading());
      final listCategory = await categoryRepo.getCategory();
      emit(CateSuccess(listCategories: listCategory));
      return listCategory;
    } catch (e) {
      emit(CateError(msg: e.toString()));
      return [];
    }
  }
}
