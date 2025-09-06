import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_delivery/core/constants/api_constants.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:food_delivery/features/payment/domain/entities/payment_request.dart';
import 'package:food_delivery/features/payment/domain/entities/payment_response.dart';

@injectable
class PaymentService {
  final baseUrl = ApiConstants.baseUrl;
  final auth = FirebaseAuth.instance.currentUser;
  final http.Client _httpClient;

  PaymentService(this._httpClient);

  /// Process MoMo payment
  Future<PaymentResponse> processMoMoPayment(PaymentRequest request) async {
    try {
      final token = await auth!.getIdToken();
      final headers = ApiConstants.authHeaders(token ?? '');

      final response = await _httpClient.post(
        Uri.parse('$baseUrl/momo'),
        headers: headers,
        body: json.encode(request.toJson()),
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body) as Map<String, dynamic>;
        return PaymentResponse.fromJson(responseData);
      } else {
        throw Exception('Payment failed with status: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Payment error: $e');
    }
  }

  void dispose() {
    _httpClient.close();
  }
}
