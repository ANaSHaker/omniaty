import 'dart:async';

import 'package:flutter/material.dart';

import 'intro.dart';

class Fimage extends StatefulWidget {
  @override
  _FimageState createState() => _FimageState();
}

class _FimageState extends State<Fimage> {

  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
            () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => IntroScreen())));
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset("assets/fimage.png"),
    );
  }
}
