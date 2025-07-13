import 'package:food_delivery/features/payment/domain/payment_method.dart';

class VNPayPayment extends PaymentMethod {
  const VNPayPayment()
    : super(
        PaymentType.vnpay,
        title: 'VNPay',
        imgUrl: 'assets/payment_methods/vnpay.png',
      );
}
