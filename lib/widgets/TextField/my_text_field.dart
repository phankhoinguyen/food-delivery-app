import 'package:flutter/material.dart';
import 'package:food_delivery/theme/my_color.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({
    super.key,
    required this.hintText,
    required this.controller,
  });
  final String hintText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF0F5FA),
        borderRadius: BorderRadius.circular(15),
      ),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: Theme.of(
            context,
          ).textTheme.bodyLarge!.copyWith(color: MyColor.hintText),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
