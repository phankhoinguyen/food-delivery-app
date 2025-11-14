import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/features/order/domain/repo/order_repo.dart';
import 'package:food_delivery/features/order/presentation/bloc/order_event.dart';
import 'package:food_delivery/features/order/presentation/bloc/order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  OrderBloc(this.repo) : super(const OrderState()) {
    on<GetOrderList>(_onGetOrderList);
  }
  final OrderRepo repo;

  Future<void> _onGetOrderList(
    GetOrderList event,
    Emitter<OrderState> emit,
  ) async {
    try {
      emit(state.copyWith(isLoading: true));
      final listResponse = await repo.getOrder();
      final listOrder = listResponse.data;
      final newState = state.copyWith(listOrder: listOrder, isLoading: false);
      emit(newState);
    } catch (e) {
      rethrow;
    }
  }
}
