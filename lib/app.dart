import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_cart/screens/add_product_screen.dart';
import 'package:my_cart/screens/categories_screen.dart';
import 'package:my_cart/screens/dashboard_screen.dart';
import 'package:my_cart/screens/login_screen.dart';
import 'package:my_cart/screens/order_screen.dart';
import 'package:my_cart/screens/settings_screen.dart';
import 'package:my_cart/screens/splash_screen.dart';
import 'package:my_cart/screens/user_screen.dart';
import 'package:my_cart/screens/view_product_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My Cart",
      theme:  ThemeData(
        colorScheme: ColorScheme.light().copyWith(primary: Colors.deepPurple),
        inputDecorationTheme:  InputDecorationTheme(

          fillColor: Colors.grey.shade200,
          filled: true,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color:  Colors.deepPurple
            )
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10)
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepPurple,
            foregroundColor: Colors.white
          )
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.deepPurple,
          foregroundColor: Colors.white
        )
      ),
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName : (context) => const SplashScreen(),
        LoginScreen.routeName : (context) => const LoginScreen(),
        DashboardScreen.routeName : (context) => const DashboardScreen(),
        AddProductScreen.routeName : (context) => const AddProductScreen(),
        ViewProductScreen.routeName : (context) => const ViewProductScreen(),
        CategoriesScreen.routeName : (context) => const CategoriesScreen(),
        UserScreen.routeName : (context) => const UserScreen(),
        SettingsScreen.routeName : (context) => const SettingsScreen(),
        OrderScreen.routeName : (context) => const OrderScreen(),
      }

    );
  }
}
