import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spectrum_kids/screens/carousel_slider.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTime();
  }
  startTime() async {
    var duration = new Duration(seconds: 5);
    return new Timer(duration, route);
  }
  route() {
    Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context) => CarouselSlider(),

    )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
            'assets/images/splash_screen_two.png',
          fit: BoxFit.cover,
          ),

      ),
    );
  }


}
