import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/features/cart/domain/entities/cart_model.dart';
import 'package:food_delivery/features/payment/domain/entities/payment_request.dart';
import 'package:food_delivery/features/payment/domain/repo/payment_repo.dart';
import 'package:food_delivery/features/payment/presentation/bloc/payment_event.dart';
import 'package:food_delivery/features/payment/presentation/bloc/payment_state.dart';
import 'package:food_delivery/features/setting/address/presentation/pages/address_page.dart';
import 'package:url_launcher/url_launcher.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  final PaymentRepo paymentRepo;

  PaymentBloc({required this.paymentRepo}) : super(const PaymentState()) {
    on<PaymentInitialized>(_onPaymentInitialized);
    on<CalculateTotals>(_onCalculateTotals);
    on<SelectPaymentMethod>(_onSelectPaymentMethod);
    on<ProcessPayment>(_onProcessPayment);
  }

  void _onPaymentInitialized(
    PaymentInitialized event,
    Emitter<PaymentState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));

    try {
      // Get selected payment method from repository if available
      final selectedPaymentType = await paymentRepo.getSelectedPaymentMethod();

      // Calculate totals
      final totalFood = _calculateTotalFood(event.cartItems);
      final total = totalFood + state.shippingCost;

      emit(
        state.copyWith(
          cartItems: event.cartItems,
          totalFood: totalFood,
          total: total,
          selectedPaymentMethod: selectedPaymentType,
          isLoading: false,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          errorMessage: 'Failed to initialize payment: ${e.toString()}',
        ),
      );
    }
  }

  void _onCalculateTotals(CalculateTotals event, Emitter<PaymentState> emit) {
    final totalFood = _calculateTotalFood(event.cartItems);
    final total = totalFood + state.shippingCost;

    emit(
      state.copyWith(
        cartItems: event.cartItems,
        totalFood: totalFood,
        total: total,
      ),
    );
  }

  void _onSelectPaymentMethod(
    SelectPaymentMethod event,
    Emitter<PaymentState> emit,
  ) async {
    emit(state.copyWith(selectedPaymentMethod: event.paymentType));
    try {
      await paymentRepo.saveSelectedPaymentMethod(event.paymentType);
    } catch (e) {
      emit(
        state.copyWith(
          errorMessage: 'Failed to save payment method: ${e.toString()}',
        ),
      );
    }
  }

  void _onProcessPayment(
    ProcessPayment event,
    Emitter<PaymentState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));

    try {
      final paymentRequest = PaymentRequest(
        orderId: event.orderId,
        amount: event.amount,
        paymentMethod: event.paymentMethod,
      );

      final paymentResponse = await paymentRepo.processPayment(paymentRequest);

      if (paymentResponse.success) {
        final url = Uri.parse(paymentResponse.data!.deepLink ?? '');
        await launchUrl(url, mode: LaunchMode.externalApplication);
        emit(
          state.copyWith(
            isLoading: false,
            paymentResponse: paymentResponse,
            isPaymentSuccessful: true,
          ),
        );
      } else {
        emit(
          state.copyWith(
            isLoading: false,
            errorMessage: paymentResponse.message,
            isPaymentSuccessful: false,
          ),
        );
      }
    } catch (e) {
      logger.w(e.toString());
      emit(
        state.copyWith(
          isLoading: false,
          errorMessage: 'Payment failed: ${e.toString()}',
          isPaymentSuccessful: false,
        ),
      );
    }
  }

  double _calculateTotalFood(List<CartModel> cartItems) {
    return cartItems.fold(0, (sum, item) => sum + (item.price * item.quantity));
  }
}
