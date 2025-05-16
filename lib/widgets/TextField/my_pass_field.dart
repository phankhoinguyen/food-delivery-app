import 'package:flutter/material.dart';
import 'package:food_delivery/theme/my_color.dart';

class MyPassField extends StatefulWidget {
  const MyPassField({super.key, required this.controller});
  final TextEditingController controller;

  @override
  State<MyPassField> createState() => _MyPassFieldState();
}

class _MyPassFieldState extends State<MyPassField> {
  bool isHidden = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: const Color(0xFFF0F5FA),
        borderRadius: BorderRadius.circular(15),
      ),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: TextField(
        controller: widget.controller,
        keyboardType: TextInputType.text,
        autocorrect: false,
        textCapitalization: TextCapitalization.none,
        obscureText: isHidden ? true : false,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(top: 18),
          hintText: '* * * * * * * * * * * * ',

          hintStyle: Theme.of(
            context,
          ).textTheme.bodyLarge!.copyWith(color: MyColor.hintText),
          border: InputBorder.none,
          suffixIcon:
              isHidden
                  ? IconButton(
                    icon: const Icon(
                      Icons.visibility,
                      color: Color(0xFFB4B9CA),
                    ),
                    onPressed: () {
                      setState(() {
                        isHidden = !isHidden;
                      });
                    },
                  )
                  : IconButton(
                    icon: const Icon(
                      Icons.visibility_off,
                      color: Color(0xFFB4B9CA),
                    ),
                    onPressed: () {
                      setState(() {
                        isHidden = !isHidden;
                      });
                    },
                  ),
        ),
      ),
    );
  }
}
