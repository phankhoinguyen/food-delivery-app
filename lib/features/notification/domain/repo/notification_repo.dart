import 'package:food_delivery/features/notification/domain/entities/notification_entity.dart';

abstract class NotificationRepo {
  Future<List<NotificationEntity>> getNotifications();
  Future<void> markReadAll();
  Future<int> getUnreadNoifications();
}
