import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_item_entity.freezed.dart';
part 'order_item_entity.g.dart';

@freezed
class OrderItemEntity with _$OrderItemEntity {
  const factory OrderItemEntity({
    required String id,
    required String name,
    required int quantity,
    required int price,
    required String imgUrl,
  }) = _OrderItemEntity;

  factory OrderItemEntity.fromJson(Map<String, dynamic> json) =>
      _$OrderItemEntityFromJson(json);
}
