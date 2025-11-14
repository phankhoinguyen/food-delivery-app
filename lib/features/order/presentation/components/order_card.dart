import 'package:flutter/material.dart';
import 'package:food_delivery/core/constants/helper.dart';
import 'package:food_delivery/core/theme/my_color.dart';
import 'package:food_delivery/features/order/domain/entities/order_entity.dart';
import 'package:food_delivery/features/order/presentation/components/order_item.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({super.key, required this.orderItem});
  final OrderEntity orderItem;

  (Color, Color) get _colors => switch (orderItem.preparationStatus
      .toLowerCase()) {
    'pending' => (MyColor.primary.withValues(alpha: 0.20), MyColor.primary),
    'preparing' => (MyColor.myBlue.withValues(alpha: 0.20), MyColor.myBlue),
    'completed' => (MyColor.success.withValues(alpha: 0.20), MyColor.success),
    _ => (Colors.grey.shade100, Colors.grey.shade700),
  };

  @override
  Widget build(BuildContext context) {
    final (bgColor, textColor) = _colors;
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              orderItem.preparationStatus.capitalize(),
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: textColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: orderItem.items.length,
            itemBuilder:
                (context, index) => OrderItem(item: orderItem.items[index]),
          ),
          Text(
            'Total amount (${orderItem.items.length} product): ${orderItem.amount.toVND()}đ',
          ),
        ],
      ),
    );
  }
}
