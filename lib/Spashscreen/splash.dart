import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import'package:flutter/material.dart';
import 'package:visanka/onboarding/welcome.dart';


class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  FlutterSplashScreen.scale(
      backgroundColor: Colors.white,
      childWidget: SizedBox(
        height: 450,
        width: 450,
        child: Image.asset("assets/images/splash/REMlogo.png"),
      ),
      duration: const Duration(milliseconds: 6000),
      nextScreen:  Welcome(),
    );

  }
}