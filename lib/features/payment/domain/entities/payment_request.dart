import 'package:equatable/equatable.dart';

class PaymentRequest extends Equatable {
  final String orderId;
  final double amount;
  final String paymentMethod;

  const PaymentRequest({
    required this.orderId,
    required this.amount,
    required this.paymentMethod,
  });

  Map<String, dynamic> toJson() {
    return {
      'orderId': orderId,
      'amount': amount,
      'paymentMethod': paymentMethod,
    };
  }

  factory PaymentRequest.fromJson(Map<String, dynamic> json) {
    return PaymentRequest(
      orderId: json['orderId'] as String,
      amount: (json['amount'] as num).toDouble(),
      paymentMethod: json['paymentMethod'] as String,
    );
  }

  @override
  List<Object?> get props => [orderId, amount, paymentMethod];
}
