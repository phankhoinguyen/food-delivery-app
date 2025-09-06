import 'package:equatable/equatable.dart';
import 'package:food_delivery/features/cart/domain/entities/cart_model.dart';
import 'package:food_delivery/features/payment/domain/entities/payment_response.dart';
import 'package:food_delivery/features/payment/domain/payment_method.dart';

class PaymentState extends Equatable {
  final List<CartModel> cartItems;
  final double totalFood;
  final double shippingCost;
  final double total;
  final PaymentType? selectedPaymentMethod;
  final bool isLoading;
  final String? errorMessage;
  final PaymentResponse? paymentResponse;
  final bool isPaymentSuccessful;

  const PaymentState({
    this.cartItems = const [],
    this.totalFood = 0.0,
    this.shippingCost = 20000.0,
    this.total = 0.0,
    this.selectedPaymentMethod,
    this.isLoading = false,
    this.errorMessage,
    this.paymentResponse,
    this.isPaymentSuccessful = false,
  });

  PaymentState copyWith({
    List<CartModel>? cartItems,
    double? totalFood,
    double? shippingCost,
    double? total,
    PaymentType? selectedPaymentMethod,
    Map<PaymentType, bool>? linkedPaymentMethods,
    bool? isLoading,
    String? errorMessage,
    PaymentResponse? paymentResponse,
    bool? isPaymentSuccessful,
  }) {
    return PaymentState(
      cartItems: cartItems ?? this.cartItems,
      totalFood: totalFood ?? this.totalFood,
      shippingCost: shippingCost ?? this.shippingCost,
      total: total ?? this.total,
      selectedPaymentMethod:
          selectedPaymentMethod ?? this.selectedPaymentMethod,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
      paymentResponse: paymentResponse ?? this.paymentResponse,
      isPaymentSuccessful: isPaymentSuccessful ?? this.isPaymentSuccessful,
    );
  }

  @override
  List<Object?> get props => [
    cartItems,
    totalFood,
    shippingCost,
    total,
    selectedPaymentMethod,
    isLoading,
    errorMessage,
    paymentResponse,
    isPaymentSuccessful,
  ];
}
