import 'package:flutter/material.dart';
import 'package:restaurant_app_submission/utils/preferences_helper.dart';

class PreferencesProvider extends ChangeNotifier {
  PreferencesHelper preferencesHelper;

  PreferencesProvider({required this.preferencesHelper}) {
    _getDailyRecomandationPreferences();
  }

  bool _isDailyRecomandation = false;
  bool get isDailyRecomandation => _isDailyRecomandation;

  void _getDailyRecomandationPreferences() async {
    _isDailyRecomandation = await preferencesHelper.isDailyRecomandationActive;
    notifyListeners();
  }

  void enableDailyNews(bool value) {
    preferencesHelper.setDailyRekomandation(value);
    _getDailyRecomandationPreferences();
  }
}
