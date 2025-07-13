import 'package:food_delivery/features/payment/data/cod_method.dart';
import 'package:food_delivery/features/payment/data/momo_method.dart';
import 'package:food_delivery/features/payment/data/vnpay_method.dart';
import 'package:food_delivery/features/payment/domain/payment_method.dart';
import 'package:food_delivery/features/payment/domain/repo/payment_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PaymentRepoImpl implements PaymentRepo {
  static const String _paymentMethodKey = 'selected_payment_method';

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
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_paymentMethodKey, type.index);
  }

  @override
  Future<PaymentType> getSelectedPaymentMethod() async {
    final prefs = await SharedPreferences.getInstance();
    final index = prefs.getInt(_paymentMethodKey);

    // Default to MoMo if no payment method is selected
    if (index == null || index < 0 || index >= PaymentType.values.length) {
      return PaymentType.momo;
    }

    return PaymentType.values[index];
  }
}
