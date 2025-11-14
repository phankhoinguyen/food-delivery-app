import 'package:flutter/material.dart';

class FailedStatusWidget extends StatelessWidget {
  const FailedStatusWidget({super.key});

  @override
  Widget build(BuildContext context) {
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
                color: Colors.red.withValues(alpha: 0.12),
                shape: BoxShape.circle,
              ),
              child: Image.asset(
                'assets/icons/payment_fail.png',
                width: 26,
                height: 26,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Payment Failed!',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ],
      ),
    );
  }
}
