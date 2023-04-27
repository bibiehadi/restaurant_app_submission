import 'package:flutter/material.dart';
import 'package:restaurant_app_submission/screen/restaurant_favorite/restaurant_favorite_screen.dart';
import 'package:restaurant_app_submission/screen/settings_screen/settings_page.dart';
import 'package:restaurant_app_submission/themes/themes.dart';
import '../../provider/navbar_provider.dart';
import '../../utils/notification_helper.dart';
import 'component/bottom_navbar.dart';
import '../../widget/header.dart';
import 'component/restaurant_list.dart';

import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  final NotificationHelper _notificationHelper = NotificationHelper();
  static const String namedRoute = '/home';
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetOptions = <Widget>[
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
          RestaurantFavorite(),
        ],
      ),
      Column(
        children: [
          const HomeHeader(
            title: 'Settings',
            subTitle: '',
            isSearched: false,
          ),
          const SettingsPage(),
          Center(
            child: ElevatedButton(
              child: const Text('test notification button'),
              onPressed: () async {
                await _notificationHelper.showNotification();
              },
            ),
          ),
        ],
      ),
    ];

    return Scaffold(
        backgroundColor: thirdColor,
        body: SafeArea(
            child: Consumer<NavbarProvider>(
          builder: (context, value, _) =>
              widgetOptions.elementAt(value.indexNavbar),
        )),
        bottomNavigationBar: const BottomNavBar());
  }
}
