import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/features/cart/domain/repo/cart_repo.dart';
import 'package:food_delivery/features/cart/presentation/bloc/cart_event.dart';
import 'package:food_delivery/features/cart/presentation/bloc/cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final CartRepo cartRepo;

  CartBloc({required this.cartRepo}) : super(const CartInitial()) {
    on<GetCartList>(_onGetCartList);
    on<AddToCart>(_onAddToCart);
    on<RemoveFromCart>(_onRemoveFromCart);
    on<IncreaseQuantity>(_onIncreaseQuantity);
    on<DecreaseQuantity>(_onDecreaseQuantity);
  }

  Future<void> _onGetCartList(
    GetCartList event,
    Emitter<CartState> emit,
  ) async {
    emit(const CartLoading());
    try {
      final listCart = await cartRepo.getCartList();
      emit(state.copyWith(cartItems: listCart));
    } catch (e) {
      emit(CartError(e.toString()));
    }
  }

  Future<void> _onAddToCart(AddToCart event, Emitter<CartState> emit) async {
    try {
      if (isExist(event.item.id)) {
        final updatedItems = [...state.cartItems];
        final item = updatedItems.firstWhere((e) => e.id == event.item.id);
        item.quantity += event.quantity;
        emit(const CartAddSuccess());
        emit(state.copyWith(cartItems: updatedItems));
        await cartRepo.increaseQuantity(event.item.id, event.quantity);
      } else {
        emit(state.copyWith(cartItems: [...state.cartItems, event.item]));
        await cartRepo.addToCart(event.item);
        emit(const CartAddSuccess());
      }
    } catch (e) {
      emit(CartError(e.toString()));
    }
  }

  Future<void> _onRemoveFromCart(
    RemoveFromCart event,
    Emitter<CartState> emit,
  ) async {
    try {
      final updatedItems = [...state.cartItems];
      updatedItems.removeWhere((e) => e.id == event.item.id);
      emit(state.copyWith(cartItems: updatedItems));
      await cartRepo.removeFromCart(event.item);
    } catch (e) {
      emit(CartError(e.toString()));
    }
  }

  Future<void> _onIncreaseQuantity(
    IncreaseQuantity event,
    Emitter<CartState> emit,
  ) async {
    try {
      final updatedItems = [...state.cartItems];
      final itemIndex = updatedItems.indexWhere((e) => e.id == event.itemId);
      if (itemIndex != -1) {
        updatedItems[itemIndex].quantity += event.quantity;
        emit(const CartChangeQuantity());
        emit(state.copyWith(cartItems: updatedItems));
        await cartRepo.increaseQuantity(event.itemId, event.quantity);
      }
    } catch (e) {
      emit(CartError(e.toString()));
    }
  }

  Future<void> _onDecreaseQuantity(
    DecreaseQuantity event,
    Emitter<CartState> emit,
  ) async {
    try {
      final updatedItems = [...state.cartItems];
      final itemIndex = updatedItems.indexWhere((e) => e.id == event.item.id);
      if (itemIndex != -1) {
        updatedItems[itemIndex].quantity = event.item.quantity;
        emit(const CartChangeQuantity());
        emit(state.copyWith(cartItems: updatedItems));
        await cartRepo.decreaseQuantity(event.item);
      }
    } catch (e) {
      emit(CartError(e.toString()));
    }
  }

  bool isExist(String id) {
    return state.cartItems.any((e) => e.id == id);
  }

  double calculateTotalPrice() {
    return state.totalPrice;
  }
}
