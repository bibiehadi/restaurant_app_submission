import 'package:flutter/material.dart';
import 'component/header.dart';
import 'component/restaurant_list.dart';

class HomeScreen extends StatelessWidget {
  static const String namedRoute = '/home';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: primaryColor,
      body: SafeArea(
          child: Column(
        children: const [
          HomeHeader(),
          RestaurantList(),
        ],
      )),
    );
  }
}
