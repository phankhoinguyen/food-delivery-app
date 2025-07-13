import 'package:food_delivery/features/payment/domain/payment_method.dart';

class MoMoPayment extends PaymentMethod {
  const MoMoPayment()
    : super(
        PaymentType.momo,
        title: 'MoMo E-Wallet',
        imgUrl: 'assets/payment_methods/momo.png',
      );
}
