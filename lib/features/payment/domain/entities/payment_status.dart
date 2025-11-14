class PaymentStatus {
  PaymentStatus({
    required this.orderId,
    required this.amount,
    required this.paymentMethod,
    required this.paymentStatus,
  });

  final String orderId;
  final double amount;
  final String paymentMethod;
  final String paymentStatus;

  factory PaymentStatus.fromJson(Map<String, dynamic> json) {
    return PaymentStatus(
      orderId: json['orderId'],
      amount: (json['amount'] as num).toDouble(),
      paymentMethod: json['paymentMethod'],
      paymentStatus: json['paymentStatus'],
    );
  }
}
