import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_delivery/features/home/domain/entities/product_model.dart';
import 'package:food_delivery/features/home/domain/repo/product_repo.dart';

class ProductRepoFirestore implements ProductRepo {
  final _db = FirebaseFirestore.instance;
  @override
  Future<List<ProductModel>> getProduct() async {
    final ref = await _db.collection('products').get();
    final listProducts =
        ref.docs.map((product) {
          return ProductModel.fromJson(product.data());
        }).toList();
    return listProducts;
  }

  @override
  Future<List<ProductModel>> getProductByCate(String category) async {
    final ref =
        await _db
            .collection('products')
            .where('category', isEqualTo: category)
            .get();
    final listProductsId =
        ref.docs.map((product) {
          return ProductModel.fromJson(product.data());
        }).toList();
    return listProductsId;
  }
}
