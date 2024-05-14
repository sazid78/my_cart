import 'package:flutter/material.dart';
import 'package:my_cart/screens/dashboard_screen.dart';
import 'package:my_cart/screens/login_screen.dart';
import 'package:my_cart/screens/splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My Cart",
      theme:  ThemeData(
        primarySwatch: Colors.deepPurple
      ),
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName : (context) => const SplashScreen(),
        LoginScreen.routeName : (context) => const LoginScreen(),
        DashboardScreen.routeName : (context) => const DashboardScreen(),
      }
    );
  }
}
