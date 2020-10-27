import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

import 'Drawer.dart';
import 'constants.dart';




class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return   SplashScreen(
      seconds: 3,
      gradientBackground: Theme.of(context).brightness == Brightness.dark
          ? new LinearGradient(colors: [gradientDarkStart, gradientDarkEnd],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter) : new LinearGradient(colors: [gradientLightStart, gradientLightEnd],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter),

      image: Image(image: AssetImage("assets/logo.png")),
      loaderColor: Colors.white,
      photoSize: 140.0,
      loadingText: Text(
        "تحميل",
        style: TextStyle(color: Colors.white),
      ),
      navigateAfterSeconds: Draweer(),
    );
  }
}