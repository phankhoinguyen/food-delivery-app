import 'package:freezed_annotation/freezed_annotation.dart';
import 'order_item_entity.dart';

part 'order_entity.freezed.dart';
part 'order_entity.g.dart';

@freezed
class OrderEntity with _$OrderEntity {
  const factory OrderEntity({
    required String id,
    required String userId,
    required String orderId,
    required int amount,
    required String paymentMethod,
    required String preparationStatus,
    String? userToken,
    required List<OrderItemEntity> items,
    required FirestoreTimestamp createdAt,
    required String paymentStatus,
    required FirestoreTimestamp updatedAt,
  }) = _OrderEntity;

  factory OrderEntity.fromJson(Map<String, dynamic> json) =>
      _$OrderEntityFromJson(json);
}

@freezed
class FirestoreTimestamp with _$FirestoreTimestamp {
  const factory FirestoreTimestamp({
    @JsonKey(name: '_seconds') required int seconds,

    @JsonKey(name: '_nanoseconds') required int nanoseconds,
  }) = _FirestoreTimestamp;

  factory FirestoreTimestamp.fromJson(Map<String, dynamic> json) =>
      _$FirestoreTimestampFromJson(json);
}
