import 'package:freezed_annotation/freezed_annotation.dart';
part 'notification_event.freezed.dart';

@freezed
abstract class NotificationEvent with _$NotificationEvent {
  const factory NotificationEvent.getNotifications() = GetNotifications;
  const factory NotificationEvent.getUnreadNotificationsCount() =
      GetUnreadNotificationsCount;
  const factory NotificationEvent.markReadAll() = MarkReadAll;
  const factory NotificationEvent.updateNotificationBadge() =
      UpdateNotificationBadge;
}
