import 'dart:io';

import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app_submission/provider/navbar_provider.dart';
import 'package:restaurant_app_submission/provider/preferences_provider.dart';
import 'package:restaurant_app_submission/provider/restaurant_favorite_provider.dart';
import 'package:restaurant_app_submission/provider/restaurant_list_provider.dart';
import 'package:restaurant_app_submission/provider/scheduling_provider.dart';
import 'package:restaurant_app_submission/screen/home/home_screen.dart';
import 'package:restaurant_app_submission/screen/restaurant_detail/restaurant_screen.dart';
import 'package:restaurant_app_submission/screen/restaurant_search/restaurant_search_screen.dart';
import 'package:restaurant_app_submission/screen/splash_screen.dart';
import 'package:restaurant_app_submission/themes/themes.dart';
import 'package:restaurant_app_submission/utils/background_service.dart';
import 'package:restaurant_app_submission/utils/notification_helper.dart';
import 'package:restaurant_app_submission/utils/navigation.dart';
import 'package:restaurant_app_submission/utils/preferences_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'data/api/api_service.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final NotificationHelper notificationHelper = NotificationHelper();
  await notificationHelper.initNotifications(flutterLocalNotificationsPlugin);
  notificationHelper.requestIOSPermissions(flutterLocalNotificationsPlugin);

  final BackgroundService service = BackgroundService();
  service.initializeIsolate();

  if (Platform.isAndroid) {
    await AndroidAlarmManager.initialize();
  }

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final NotificationHelper _notificationHelper = NotificationHelper();

  @override
  void initState() {
    super.initState();
    _notificationHelper
        .configureSelectNotificationSubject(RestaurantScreen.namedRoute);
    _notificationHelper.configureDidReceiveLocalNotificationSubject(
        context, RestaurantScreen.namedRoute);
  }

  @override
  void dispose() {
    selectNotificationSubject.close();
    didReceiveLocalNotificationSubject.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<RestaurantProvider>(
          create: (_) => RestaurantProvider(apiService: ApiService()),
        ),
        ChangeNotifierProvider<NavbarProvider>(
          create: (_) => NavbarProvider(),
        ),
        ChangeNotifierProvider<RestaurantFavoriteProvider>(
          create: (_) => RestaurantFavoriteProvider(),
        ),
        ChangeNotifierProvider<SchedulingProvider>(
          create: (_) => SchedulingProvider(),
        ),
        ChangeNotifierProvider<PreferencesProvider>(
          create: (_) => PreferencesProvider(
            preferencesHelper: PreferencesHelper(
              sharedPreferences: SharedPreferences.getInstance(),
            ),
          ),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: primaryColor,
              secondary: secondaryColor,
              onPrimary: thirdColor),
          textTheme: myTextTheme,
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: secondaryColor,
              foregroundColor: thirdColor,
              textStyle: const TextStyle(),
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5))),
            ),
          ),
        ),
        navigatorKey: navigatorKey,
        initialRoute: '/splashscreen',
        routes: {
          '/splashscreen': (context) => const SplashScreen(),
          '/home': (context) => HomeScreen(),
          '/restaurant': (context) => RestaurantScreen(
              restaurantId:
                  ModalRoute.of(context)?.settings.arguments as String),
          SearchScreen.namedRoute: (context) => const SearchScreen(),
        },
        //test push new branch to public git
      ),
    );
  }
}
