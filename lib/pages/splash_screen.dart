import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';
import 'package:food_delivery/core/theme/my_color.dart';

@Preview(name: 'splash')
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: MyColor.imageBackground,
      body: Stack(
        children: [
          Image.asset(
            'assets/food_pattern.png',
            repeat: ImageRepeat.repeatY,
            height: size.height,
            color: MyColor.imageBackground2,
          ),
          Center(
            // child: AnimatedSplashScreen(
            //   splash: LottieBuilder.asset('assets/loading2.json'),
            //   nextScreen: const SafeArea(
            //     bottom: false,
            //     top: false,
            //     child: const AuthGate(),
            //   ),
            //   splashIconSize: 250,
            //   // duration: 4800,
            // ),
            child: Image.asset('assets/logo.png'),
          ),
        ],
      ),
    );
  }
}
