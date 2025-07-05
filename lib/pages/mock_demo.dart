import 'package:flutter/material.dart';

import 'package:food_delivery/core/theme/my_color.dart';

class MockDemo extends StatelessWidget {
  const MockDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(color: MyColor.imageBackground),
        width: double.infinity,
        height: 900,
        child: Image.asset(
          'assets/food_pattern.png',
          repeat: ImageRepeat.repeatY,
          color: MyColor.imageBackground2,
        ),
      ),
    );
  }
}
