import 'package:freezed_annotation/freezed_annotation.dart';
part 'order_event.freezed.dart';

@freezed
abstract class OrderEvent with _$OrderEvent {
  const factory OrderEvent.getOrderList() = GetOrderList;
}
