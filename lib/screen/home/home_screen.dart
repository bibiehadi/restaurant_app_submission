import 'package:flutter/material.dart';
import 'package:restaurant_app_submission/provider/restaurant_list_provider.dart';
import '../../data/api/api_service.dart';
import 'component/header.dart';
import 'component/restaurant_list.dart';

import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  static const String namedRoute = '/home';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: primaryColor,
      body: SafeArea(
          child: Column(
        children: [
          const HomeHeader(),
          ChangeNotifierProvider<RestaurantProvider>(
            create: (_) => RestaurantProvider(apiService: ApiService()),
            child: const RestaurantList(),
          )
        ],
      )),
    );
  }
}
