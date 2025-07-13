import 'package:food_delivery/features/payment/domain/payment_method.dart';

class CashOnDeliveryPayment extends PaymentMethod {
  const CashOnDeliveryPayment()
    : super(
        PaymentType.cod,
        title: 'Cash on Delivery',
        imgUrl: 'assets/payment_methods/cod.png',
      );
}
