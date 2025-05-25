import 'package:flutter/material.dart';
import 'package:food_delivery/theme/my_color.dart';

class MyButon extends StatelessWidget {
  const MyButon({super.key, required this.text, required this.onTap});
  final String? text;
  final void Function()? onTap;

  const MyButon.loading({super.key}) : text = null, onTap = null;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: MyColor.primary.withOpacity(0.9),
        borderRadius: BorderRadius.circular(15),
        onTap: onTap,
        child: Ink(
          decoration: BoxDecoration(
            color: MyColor.primary,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Center(
              child:
                  text != null
                      ? Text(
                        text!,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: MyColor.headerTextColor,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                      : const SizedBox(
                        width: 20,
                        height: 20,

                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      ),
            ),
          ),
        ),
      ),
    );
  }
}
