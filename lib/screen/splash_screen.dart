import 'dart:async';

import 'package:flutter/material.dart';
import 'package:restaurant_app_submission/themes/themes.dart';

class SplashScreen extends StatefulWidget {
  static const String namedRoute = '/splashscreen';

  const SplashScreen({super.key});
  @override
  State<StatefulWidget> createState() {
    return _SplashScreen();
  }
}

class _SplashScreen extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    splacescreenStart();
  }

  splacescreenStart() async {
    var duration = const Duration(seconds: 3);
    return Timer(duration, () {
      Navigator.pushReplacementNamed(context, '/home');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primaryColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const <Widget>[
              Icon(
                Icons.food_bank,
                size: 180,
                color: Colors.black87,
              ),
              SizedBox(
                height: 12.0,
              ),
              Text(
                "Restaurant App",
                style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                ),
              ),
            ],
          ),
        ));
  }
}
