import 'package:flutter/material.dart';
import 'package:food_delivery/core/theme/my_color.dart';

class InfoLabel extends StatelessWidget {
  const InfoLabel({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
        color: MyColor.labelText,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
