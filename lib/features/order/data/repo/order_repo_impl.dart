import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_delivery/core/constants/api_constants.dart';
import 'package:food_delivery/core/injection/injection.dart';
import 'package:food_delivery/features/order/domain/entities/order_response.dart';
import 'package:food_delivery/features/order/domain/repo/order_repo.dart';
import 'package:injectable/injectable.dart';
import 'package:http/http.dart' as http;

@LazySingleton(as: OrderRepo)
class OrderRepoImpl implements OrderRepo {
  final auth = getIt<FirebaseAuth>();
  @override
  Future<OrderResponse> getOrder() async {
    try {
      final token = await auth.currentUser?.getIdToken();
      final headers = ApiConstants.authHeaders(token ?? '');
      final res = await http.get(
        Uri.parse('${ApiConstants.baseUrl}/api/payment/'),
        headers: headers,
      );
      final responseData = json.decode(res.body) as Map<String, dynamic>;

      final data = OrderResponse.fromJson(responseData);
      return data;
    } catch (e) {
      rethrow;
    }
  }
}
