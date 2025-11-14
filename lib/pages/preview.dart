import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';
import 'package:food_delivery/features/notification/domain/entities/notification_entity.dart';
import 'package:food_delivery/features/notification/presentation/components/notification_item.dart';

final dateTime = DateTime.now();
@Preview()
Widget notiScreenPreview() => NotificationItem(
  item: NotificationEntity(
    title: 'New noti',
    body: 'your order',
    isRead: false,
    updatedAt: dateTime,
  ),
);
