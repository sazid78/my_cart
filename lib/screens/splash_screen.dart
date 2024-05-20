import 'package:flutter/material.dart';
import 'package:my_cart/auth/auth_service.dart';
import 'package:my_cart/screens/dashboard_screen.dart';
import 'package:my_cart/screens/login_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = '/splash';
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 0), (){
      if(AuthService.currentUser != null){
        Navigator.pushReplacementNamed(context, DashboardScreen.routeName);
      }else{
        Navigator.pushReplacementNamed(context, LoginScreen.routeName);
      }
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}


