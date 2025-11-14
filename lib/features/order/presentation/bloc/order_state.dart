import 'package:food_delivery/features/order/domain/entities/order_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'order_state.freezed.dart';

@freezed
abstract class OrderState with _$OrderState {
  const factory OrderState({
    List<OrderEntity>? listOrder,
    @Default(true) bool isLoading,
  }) = _OrderState;
}
