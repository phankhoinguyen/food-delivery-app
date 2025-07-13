import 'package:food_delivery/features/payment/domain/payment_method.dart';

abstract class PaymentRepo {
  List<PaymentMethod> getAvailablePaymentMethods();
  Future<void> saveSelectedPaymentMethod(PaymentType type);
  Future<PaymentType> getSelectedPaymentMethod();
}
