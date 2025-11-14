import 'package:food_delivery/features/order/domain/entities/order_response.dart';

abstract class OrderRepo {
  Future<OrderResponse> getOrder();
}
