import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/features/cart/domain/entities/cart_model.dart';
import 'package:food_delivery/features/cart/domain/repo/cart_repo.dart';
import 'package:food_delivery/features/cart/presentation/cubits/cart_state.dart';

class CartCubits extends Cubit<CartState> {
  final CartRepo cartRepo;
  CartCubits(this.cartRepo) : super(CartInitial()) {}

  List<String> idItems = [];
  List<CartModel> listCartLocal = [];

  Future<List<CartModel>> getListCart() async {
    emit(CartLoading());
    try {
      final listCart = await cartRepo.getCartList();
      listCartLocal = listCart;
      idItems = listCart.map((e) => e.id).toList();
      emit(CartLoaded(listCart));
      return listCart;
    } catch (e) {
      emit(CartError(e.toString()));
      return [];
    }
  }

  Future<void> addToList(CartModel item, int quantity) async {
    emit(CartLoading());
    try {
      if (isExist(item.id)) {
        await cartRepo.increaseQuantity(item.id, quantity);
        listCartLocal.add(item);
        emit(CartLoaded(listCartLocal));
      } else {
        await cartRepo.addToCart(item);
        listCartLocal.add(item);
        emit(CartLoaded(listCartLocal));
      }
      emit(CartAddSuccess());
      await getListCart();
    } catch (e) {
      emit(CartError(e.toString()));
    }
  }

  Future<void> removeFromList(CartModel item) async {
    emit(CartLoading());
    try {
      await cartRepo.removeFromCart(item);
      listCartLocal.remove(item);
      final newList = await getListCart();
      CartLoaded(newList);
    } catch (e) {
      emit(CartError(e.toString()));
    }
  }

  Future<void> increaseQuantity(String newId, int quantity) async {
    try {
      await cartRepo.increaseQuantity(newId, quantity);
      emit(CartChangeQuantity());
      await getListCart();
    } catch (e) {
      emit(CartError(e.toString()));
    }
  }

  Future<void> decreaseQuantity(CartModel item) async {
    try {
      await cartRepo.decreaseQuantity(item);
      await getListCart();
    } catch (e) {
      emit(CartError(e.toString()));
    }
  }

  bool isExist(String id) {
    return idItems.contains(id);
  }
}
