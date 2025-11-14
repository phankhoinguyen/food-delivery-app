import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/core/constants/helper.dart';
import 'package:food_delivery/features/order/domain/entities/order_item_entity.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({super.key, required this.item});
  final OrderItemEntity item;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CachedNetworkImage(
                imageUrl: item.imgUrl,
                placeholder:
                    (context, url) => const CircularProgressIndicator(),
                errorWidget:
                    (context, url, error) =>
                        Container(width: 50, height: 50, color: Colors.amber),
                width: 100,
                height: 100,
              ),
              const SizedBox(width: 5),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(item.name),
                    const SizedBox(height: 60),
                    Row(
                      children: [
                        Text(item.quantity.toString()),
                        const Spacer(),
                        Text(item.price.toVND()),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Divider(),
        ],
      ),
    );
  }
}
