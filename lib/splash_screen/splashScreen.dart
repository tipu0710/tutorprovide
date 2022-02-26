import 'dart:async';

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:tutorprovide/home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Image.asset(
        "assets/logo2.png",
        height: 150,
      ),
    ));
  }

  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushAndRemoveUntil(
          context,
          PageTransition(
              type: PageTransitionType.fade,
              child: const HomePage(),
              alignment: Alignment.center,
              duration: const Duration(milliseconds: 1500)),
          (Route<dynamic> route) => false);
    });
    super.initState();
  }
}
