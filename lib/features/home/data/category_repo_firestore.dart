import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_delivery/features/home/domain/entities/category_model.dart';
import 'package:food_delivery/features/home/domain/repo/category_repo.dart';

class CategoryRepoFirestore implements CategoryRepo {
  final _db = FirebaseFirestore.instance;
  @override
  Future<List<CategoryModel>> getCategory() async {
    final ref = await _db.collection('categories').get();
    final listCategory =
        ref.docs.map((category) {
          return CategoryModel.fromJson(category.data());
        }).toList();

    return listCategory;
  }
}
