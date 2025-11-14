class PaymentRedirect {
  const PaymentRedirect({
    required this.dayTime,
    required this.hoursTime,
    required this.orderId,
    required this.amount,
  });
  final String dayTime;
  final String hoursTime;
  final String orderId;
  final String amount;
}
