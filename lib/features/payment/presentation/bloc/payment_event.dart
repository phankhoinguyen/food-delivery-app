import 'package:equatable/equatable.dart';
import 'package:food_delivery/features/cart/domain/entities/cart_model.dart';
import 'package:food_delivery/features/payment/domain/payment_method.dart';

abstract class PaymentEvent extends Equatable {
  const PaymentEvent();

  @override
  List<Object?> get props => [];
}

class PaymentInitialized extends PaymentEvent {
  final List<CartModel> cartItems;

  const PaymentInitialized({required this.cartItems});

  @override
  List<Object?> get props => [cartItems];
}

class CalculateTotals extends PaymentEvent {
  final List<CartModel> cartItems;

  const CalculateTotals({required this.cartItems});

  @override
  List<Object?> get props => [cartItems];
}

class SelectPaymentMethod extends PaymentEvent {
  final PaymentType paymentType;

  const SelectPaymentMethod(this.paymentType);

  @override
  List<Object?> get props => [paymentType];
}

class ProcessPayment extends PaymentEvent {
  final String orderId;
  final double amount;
  final String paymentMethod;

  const ProcessPayment({
    required this.orderId,
    required this.amount,
    required this.paymentMethod,
  });

  @override
  List<Object?> get props => [orderId, amount, paymentMethod];
}
