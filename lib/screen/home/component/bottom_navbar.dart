import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/navbar_provider.dart';
import '../../../themes/themes.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<NavbarProvider>(
      builder: (context, state, _) => BottomNavigationBar(
          backgroundColor: Colors.grey.shade200,
          elevation: 1,
          selectedItemColor: secondaryColor,
          iconSize: 25,
          unselectedItemColor: primaryColor,
          showUnselectedLabels: false,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded),
              label: 'Home',
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite_rounded), label: 'Favorite'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings_rounded), label: 'Settings'),
          ],
          currentIndex: state.indexNavbar,
          onTap: (index) {
            state.setIndexNavbar(index);
          }),
    );
  }
}
