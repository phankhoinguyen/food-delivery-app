import 'package:flutter/foundation.dart';
import 'package:food_delivery/features/notification/domain/entities/notification_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'notification_state.freezed.dart';

@freezed
abstract class NotificationState with _$NotificationState {
  const factory NotificationState({
    required bool isLoading,
    List<NotificationEntity>? listNoti,
    int? unreadQuantity,
  }) = _NotificationState;
}
