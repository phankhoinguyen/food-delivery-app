import 'package:flutter/foundation.dart';
import 'package:food_delivery/core/utils/firebase_timestamp_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'notification_entity.freezed.dart';
part 'notification_entity.g.dart';

@freezed
class NotificationEntity with _$NotificationEntity {
  const factory NotificationEntity({
    required String title,
    required String body,
    required bool isRead,
    @FirebaseTimestampConverter() required DateTime updatedAt,
  }) = _NotificationEntity;

  factory NotificationEntity.fromJson(Map<String, dynamic> json) =>
      _$NotificationEntityFromJson(json);
}
