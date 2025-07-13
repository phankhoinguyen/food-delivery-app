import 'package:flutter/material.dart';

class SettingTile extends StatelessWidget {
  const SettingTile({
    super.key,
    required this.text,
    required this.onTap,
    required this.imgUrl,
    this.color,
  });
  final String text;
  final String imgUrl;
  final void Function() onTap;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 224, 231, 239),
          borderRadius: BorderRadius.circular(15),
        ),
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 25,
              backgroundColor: Colors.white,
              child: Image.asset(
                imgUrl,
                fit: BoxFit.cover,
                width: 35,
                height: 35,
                color: color,
              ),
            ),
            const SizedBox(width: 10),
            Text(
              text,
              style: Theme.of(
                context,
              ).textTheme.bodyLarge!.copyWith(color: const Color(0xff6B6E82)),
            ),
            const Spacer(),
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
