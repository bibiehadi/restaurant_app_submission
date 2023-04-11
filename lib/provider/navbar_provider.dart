import 'package:flutter/material.dart';

class NavbarProvider extends ChangeNotifier {
  int _indexNavbar = 0;

  int get indexNavbar => _indexNavbar;

  void setIndexNavbar(int index) {
    _indexNavbar = index;
    notifyListeners();
  }
}
