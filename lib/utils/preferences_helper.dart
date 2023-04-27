// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesHelper {
  final Future<SharedPreferences> sharedPreferences;

  PreferencesHelper({
    required this.sharedPreferences,
  });

  static const recomRestaurant = 'Daily_Notification';

  Future<bool> get isDailyRecomandationActive async {
    final prefs = await sharedPreferences;
    return prefs.getBool(recomRestaurant) ?? false;
  }

  void setDailyRekomandation(bool value) async {
    final prefs = await sharedPreferences;
    prefs.setBool(recomRestaurant, value);
  }
}
