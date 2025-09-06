import 'package:food_delivery/features/payment/domain/payment_method.dart';
import 'package:food_delivery/features/payment/domain/entities/payment_request.dart';
import 'package:food_delivery/features/payment/domain/entities/payment_response.dart';

abstract class PaymentRepo {
  List<PaymentMethod> getAvailablePaymentMethods();
  Future<void> saveSelectedPaymentMethod(PaymentType type);
  Future<PaymentType> getSelectedPaymentMethod();
  Future<PaymentResponse> processPayment(PaymentRequest request);
}
