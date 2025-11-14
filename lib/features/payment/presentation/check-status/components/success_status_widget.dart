import 'package:flutter/material.dart';
import 'package:food_delivery/core/theme/my_color.dart';
import 'package:food_delivery/features/payment/domain/entities/payment_redirect.dart';
import 'package:intl/intl.dart';

class SuccessStatusWidget extends StatelessWidget {
  const SuccessStatusWidget({super.key, this.order, this.codAmount});
  final PaymentRedirect? order;
  final String? codAmount;
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    final dayTime =
        order?.dayTime ?? DateFormat('dd/MM/yyyy HH:mm:ss').format(now);
    final hoursTime = order?.hoursTime ?? DateFormat('HH:mm:ss').format(now);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Material(
            elevation: 10,
            shape: const CircleBorder(),
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color.fromARGB(
                  255,
                  35,
                  162,
                  109,
                ).withValues(alpha: 0.12),
                shape: BoxShape.circle,
              ),
              child: Image.asset('assets/icons/payment_success.png'),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Payment Success!',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          const SizedBox(height: 20),
          const Divider(),
          billRow(context, title: 'Date', detail: dayTime),
          billRow(context, title: 'Time', detail: hoursTime),
          billRow(
            context,
            title: 'Payment method',
            detail: (order != null) ? 'MOMO' : 'COD',
          ),
          const SizedBox(height: 10),
          const Divider(),
          billRow(
            context,
            title: 'Amount',
            detail: order?.amount ?? codAmount ?? '',
          ),
        ],
      ),
    );
  }

  Row billRow(
    BuildContext context, {
    required String title,
    required String detail,
  }) => Row(
    children: [
      Text(
        title,
        style: Theme.of(
          context,
        ).textTheme.titleMedium!.copyWith(color: MyColor.secondaryText),
      ),
      const Spacer(),
      Text(
        detail,
        style: Theme.of(
          context,
        ).textTheme.titleMedium!.copyWith(color: Colors.black),
      ),
    ],
  );
}
