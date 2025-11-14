import 'package:flutter/material.dart';
import 'package:food_delivery/core/theme/my_color.dart';
import 'package:food_delivery/features/notification/domain/entities/notification_entity.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({super.key, required this.item});
  final NotificationEntity item;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: item.isRead ? null : MyColor.primary.withValues(alpha: 0.15),
      ),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(13),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: MyColor.primary.withValues(alpha: 0.3),
            ),
            child: Image.asset(
              'assets/icons/food_notification.png',
              height: 22,
              width: 22,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(item.body, style: Theme.of(context).textTheme.bodyLarge),
                const SizedBox(height: 5),
                Text(
                  item.updatedAt.toString(),
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium!.copyWith(color: MyColor.hintText),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
