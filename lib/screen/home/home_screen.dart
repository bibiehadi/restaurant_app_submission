import 'package:flutter/material.dart';
import 'package:restaurant_app_submission/provider/restaurant_list_provider.dart';
import 'package:restaurant_app_submission/themes/themes.dart';
import '../../data/api/api_service.dart';
import '../../provider/navbar_provider.dart';
import 'component/bottom_navbar.dart';
import '../../widget/header.dart';
import 'component/restaurant_list.dart';

import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  static const String namedRoute = '/home';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> _widgetOptions = <Widget>[
      Column(
        children: const [
          HomeHeader(
            title: 'Restaurant',
            subTitle: 'Recomandation Restaurants For You!',
            isSearched: true,
          ),
          RestaurantList(),
        ],
      ),
      Column(
        children: const [
          HomeHeader(
            title: 'Favorite',
            subTitle: 'Your Favorite Restaurants!',
            isSearched: false,
          ),
          Text('Favorite'),
        ],
      ),
      Column(
        children: const [
          HomeHeader(
            title: 'Settings',
            subTitle: '',
            isSearched: false,
          ),
          Text('Settings'),
        ],
      ),
    ];

    return MultiProvider(
      providers: [
        ChangeNotifierProvider<RestaurantProvider>(
          create: (_) => RestaurantProvider(apiService: ApiService()),
        ),
        ChangeNotifierProvider<NavbarProvider>(
          create: (_) => NavbarProvider(),
        )
      ],
      child: Scaffold(
          backgroundColor: thirdColor,
          body: SafeArea(
              child: Consumer<NavbarProvider>(
            builder: (context, value, _) =>
                _widgetOptions.elementAt(value.indexNavbar),
          )),
          bottomNavigationBar: const BottomNavBar()),
    );
  }
}
