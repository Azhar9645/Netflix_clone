import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:netflix_clone/presentation/main_page/screen_main_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    gotoMain(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:
            Lottie.asset('assets/Animation - 1722575003154.json', width: 350),
      ),
    );
  }
}

gotoMain(context) {
  Timer(const Duration(seconds: 4), () {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => ScreenMainPage()));
  });
}
