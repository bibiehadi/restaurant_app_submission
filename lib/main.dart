import 'package:flutter/material.dart';
import 'package:restaurant_app_submission/screen/home/home_screen.dart';
import 'package:restaurant_app_submission/screen/restaurant_detail/restaurant_screen.dart';
import 'package:restaurant_app_submission/screen/splash_screen.dart';
import 'package:restaurant_app_submission/themes/themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      initialRoute: '/splashscreen',
      routes: {
        '/splashscreen': (context) => const SplashScreen(),
        '/home': (context) => const HomeScreen(),
        RestaurantScreen.namedRoute: (context) => RestaurantScreen(
            restaurantId: ModalRoute.of(context)?.settings.arguments as String)
      },
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
