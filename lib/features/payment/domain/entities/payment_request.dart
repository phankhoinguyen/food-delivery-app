import 'package:equatable/equatable.dart';

class PaymentRequest extends Equatable {
  final String orderId;
  final double amount;
  final String address;
  final String paymentMethod;
  final List<Map<String, dynamic>> items;

  const PaymentRequest({
    required this.address,
    required this.orderId,
    required this.amount,
    required this.paymentMethod,
    required this.items,
  });

  Map<String, dynamic> toJson() {
    return {
      'orderId': orderId,
      'amount': amount,
      'address': address,
      'paymentMethod': paymentMethod,
      'items': items,
    };
  }

  @override
  List<Object?> get props => [orderId, amount, paymentMethod, address];
}
