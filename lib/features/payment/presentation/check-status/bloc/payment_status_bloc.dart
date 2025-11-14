import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/features/payment/domain/repo/payment_repo.dart';
import 'package:food_delivery/features/payment/presentation/check-status/bloc/payment_status_event.dart';
import 'package:food_delivery/features/payment/presentation/check-status/bloc/payment_status_state.dart';

class PaymentStatusBloc extends Bloc<PaymentStatusEvent, PaymentStatusState> {
  final PaymentRepo repo;
  PaymentStatusBloc(this.repo) : super(PaymentStatusState()) {
    on<InitializeStatus>(_onInitializeStatus);
  }

  FutureOr<void> _onInitializeStatus(
    InitializeStatus event,
    Emitter<PaymentStatusState> emit,
  ) async {
    try {
      final paymentStatus = await repo.checkPaymentStatus(event.orderId);
      if (paymentStatus.paymentStatus == 'completed') {
        emit(state.copyWith(success: true));
      } else {
        emit(state.copyWith(success: false));
      }
    } catch (e) {
      throw e.toString();
    }
  }
}
