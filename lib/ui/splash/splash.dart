import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:connectgamermobile/ui/splash/first_screen.dart';
import 'package:flutter/material.dart';


class SplashScreen  extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        child : AnimatedSplashScreen(
            duration: 2000,
            splash: Image.asset('assets/images/Logo.png'),
            splashIconSize: 200,
            nextScreen: const FirstScreen(),
            splashTransition: SplashTransition.scaleTransition,
            backgroundColor: Colors.white54));
  }
}
