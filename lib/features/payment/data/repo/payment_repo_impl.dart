import 'package:food_delivery/features/payment/data/cod_method.dart';
import 'package:food_delivery/features/payment/data/momo_method.dart';
import 'package:food_delivery/features/payment/data/services/payment_service.dart';
import 'package:food_delivery/features/payment/data/vnpay_method.dart';
import 'package:food_delivery/features/payment/domain/entities/payment_request.dart';
import 'package:food_delivery/features/payment/domain/entities/payment_response.dart';
import 'package:food_delivery/features/payment/domain/entities/payment_status.dart';
import 'package:food_delivery/features/payment/domain/payment_method.dart';
import 'package:food_delivery/features/payment/domain/repo/payment_repo.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@LazySingleton(as: PaymentRepo)
class PaymentRepoImpl implements PaymentRepo {
  static const String _paymentMethodKey = 'selected_payment_method';

  final PaymentService _paymentService;
  final SharedPreferences _prefs;

  PaymentRepoImpl(this._prefs, this._paymentService);

  final List<PaymentMethod> _availablePaymentMethods = [
    const MoMoPayment(),
    const VNPayPayment(),
    const CashOnDeliveryPayment(),
  ];

  @override
  List<PaymentMethod> getAvailablePaymentMethods() {
    return _availablePaymentMethods;
  }

  @override
  Future<void> saveSelectedPaymentMethod(PaymentType type) async {
    await _prefs.setInt(_paymentMethodKey, type.index);
  }

  @override
  Future<PaymentType> getSelectedPaymentMethod() async {
    final index = _prefs.getInt(_paymentMethodKey);

    // Default to MoMo if no payment method is selected
    if (index == null || index < 0 || index >= PaymentType.values.length) {
      return PaymentType.momo;
    }

    return PaymentType.values[index];
  }

  @override
  Future<PaymentResponse> processPayment(PaymentRequest request) async {
    switch (request.paymentMethod.toLowerCase()) {
      case 'momo':
        return await _paymentService.processMoMoPayment(request);

      case 'cod':
        return const PaymentResponse(
          success: true,
          message: 'Cash on delivery order placed successfully',
          data: PaymentData(
            paymentId: 'cod_payment',
            provider: 'cod',
            status: 'confirmed',
          ),
        );
      default:
        throw Exception('Unsupported payment method: ${request.paymentMethod}');
    }
  }

  @override
  Future<PaymentStatus> checkPaymentStatus(String orderId) async {
    return _paymentService.checkPaymentStatus(orderId);
  }
}
