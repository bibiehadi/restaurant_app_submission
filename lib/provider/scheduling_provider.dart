import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/widgets.dart';
import 'package:restaurant_app_submission/utils/background_service.dart';
import 'package:restaurant_app_submission/utils/datetime_helper.dart';

class SchedulingProvider extends ChangeNotifier {
  bool _isScheduled = false;

  bool get isScheduled => _isScheduled;

  Future<bool> scheduledRecomRestaurant(bool value) async {
    _isScheduled = value;
    if (_isScheduled) {
      print('Scheduling notification is active');
      notifyListeners();
      return await AndroidAlarmManager.periodic(
          const Duration(hours: 24), 1, BackgroundService.callback,
          startAt: DateTimeHelper.format(), exact: true, wakeup: true);
    } else {
      print('Scheduling notification canceled');
      notifyListeners();
      return await AndroidAlarmManager.cancel(1);
    }
  }
}
