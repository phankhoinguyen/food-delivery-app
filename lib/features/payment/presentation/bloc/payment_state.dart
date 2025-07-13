import 'package:equatable/equatable.dart';
import 'package:food_delivery/features/cart/domain/entities/cart_model.dart';
import 'package:food_delivery/features/payment/domain/payment_method.dart';

class PaymentState extends Equatable {
  final List<CartModel> cartItems;
  final double totalFood;
  final double shippingCost;
  final double total;
  final PaymentType? selectedPaymentMethod;
  final Map<PaymentType, bool> linkedPaymentMethods;
  final bool isLoading;
  final String? errorMessage;

  const PaymentState({
    this.cartItems = const [],
    this.totalFood = 0.0,
    this.shippingCost = 20000.0,
    this.total = 0.0,
    this.selectedPaymentMethod,
    this.linkedPaymentMethods = const {
      PaymentType.momo: false,
      PaymentType.vnpay: false,
      PaymentType.cod: true,
    },
    this.isLoading = false,
    this.errorMessage,
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
  }) {
    return PaymentState(
      cartItems: cartItems ?? this.cartItems,
      totalFood: totalFood ?? this.totalFood,
      shippingCost: shippingCost ?? this.shippingCost,
      total: total ?? this.total,
      selectedPaymentMethod:
          selectedPaymentMethod ?? this.selectedPaymentMethod,
      linkedPaymentMethods: linkedPaymentMethods ?? this.linkedPaymentMethods,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [
    cartItems,
    totalFood,
    shippingCost,
    total,
    selectedPaymentMethod,
    linkedPaymentMethods,
    isLoading,
    errorMessage,
  ];
}
