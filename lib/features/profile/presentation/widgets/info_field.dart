import 'package:flutter/material.dart';

class InfoField extends StatelessWidget {
  const InfoField({super.key, required this.text, required this.onTap});
  final String text;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 224, 231, 239),
          borderRadius: BorderRadius.circular(15),
        ),
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: Theme.of(
                context,
              ).textTheme.bodyLarge!.copyWith(color: const Color(0xff6B6E82)),
            ),
            const Icon(
              Icons.arrow_forward_ios_outlined,
              color: Color(0xff6B6E82),
              size: 15,
            ),
          ],
        ),
      ),
    );
  }
}
