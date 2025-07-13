import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/features/cart/domain/entities/cart_model.dart';
import 'package:food_delivery/features/payment/domain/payment_method.dart';
import 'package:food_delivery/features/payment/domain/repo/payment_repo.dart';
import 'package:food_delivery/features/payment/presentation/bloc/payment_event.dart';
import 'package:food_delivery/features/payment/presentation/bloc/payment_state.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  final PaymentRepo paymentRepo;

  PaymentBloc({required this.paymentRepo}) : super(const PaymentState()) {
    on<PaymentInitialized>(_onPaymentInitialized);
    on<CalculateTotals>(_onCalculateTotals);
    on<SelectPaymentMethod>(_onSelectPaymentMethod);
    on<LinkPaymentMethod>(_onLinkPaymentMethod);
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
    // Check if the payment method is linked
    if (state.linkedPaymentMethods[event.paymentType] == true) {
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
    } else {
      emit(
        state.copyWith(errorMessage: 'Please link this payment method first'),
      );
    }
  }

  void _onLinkPaymentMethod(
    LinkPaymentMethod event,
    Emitter<PaymentState> emit,
  ) {
    // Mock linking a payment method
    // In a real app, this would involve actual payment gateway integration
    final updatedLinkedMethods = Map<PaymentType, bool>.from(
      state.linkedPaymentMethods,
    );
    updatedLinkedMethods[event.paymentType] = true;

    emit(
      state.copyWith(
        linkedPaymentMethods: updatedLinkedMethods,
        selectedPaymentMethod: event.paymentType,
      ),
    );
  }

  void _onProcessPayment(ProcessPayment event, Emitter<PaymentState> emit) {
    // Mock payment processing
    // In a real app, this would involve actual payment processing
    emit(state.copyWith(isLoading: true));

    // Simulate payment processing delay
    Future.delayed(const Duration(seconds: 2), () {
      emit(state.copyWith(isLoading: false));
      // Here you would navigate to a success page or show a success dialog
    });
  }

  double _calculateTotalFood(List<CartModel> cartItems) {
    return cartItems.fold(0, (sum, item) => sum + (item.price * item.quantity));
  }
}
