import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/features/auth/presentation/pages/auth_gate.dart';
import 'package:food_delivery/core/theme/my_color.dart';
import 'package:lottie/lottie.dart';

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
            child: AnimatedSplashScreen(
              splash: LottieBuilder.asset('assets/loading2.json'),
              nextScreen: SafeArea(
                bottom: false,
                top: false,
                child: AuthGate(),
              ),
              splashIconSize: 250,
              // duration: 4800,
            ),
          ),
        ],
      ),
    );
  }
}
