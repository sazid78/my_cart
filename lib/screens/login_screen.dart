import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_cart/auth/auth_service.dart';
import 'package:my_cart/db/db_helper.dart';
import 'package:my_cart/screens/dashboard_screen.dart';
import 'package:my_cart/widgets/snack_message.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/login';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailTEcontroller = TextEditingController();
  final _passwordTEcontroller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String errMsg = '';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Enter Email Address";
                  }
                  return null;
                },
                controller: _emailTEcontroller,
                decoration: const InputDecoration(
                    labelText: "Email Address",
                    prefixIcon: Icon(Icons.email_outlined)),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Enter Password";
                  }
                  return null;
                },
                controller: _passwordTEcontroller,
                decoration: const InputDecoration(
                    labelText: "Password",
                    prefixIcon: Icon(Icons.lock_outline)),
                obscureText: true,
              ),
              const SizedBox(
                height: 50,
              ),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                    onPressed: _authenticate, child: const Text("Admin Login")),
              )
            ],
          ),
        ),
      ),
    ));
  }

  @override
  void dispose() {
    _emailTEcontroller.dispose();
    _passwordTEcontroller.dispose();
    super.dispose();
  }

  void _authenticate() async{
    if (_formKey.currentState!.validate()) {
      final email = _emailTEcontroller.text;
      final password  = _passwordTEcontroller.text;
      try{
        final user = await  AuthService.loginAdmin(email, password);
        final isAdmin = await DbHelper.isAdmin(user.uid);
        if(isAdmin){
          Navigator.pushReplacementNamed(context, DashboardScreen.routeName);
        }else{
          AuthService.logoutAdmin();
          setState(() {
            appSnackMessage(context, "You are not register admin . try again",true);
          });
        }

      } on FirebaseAuthException catch (error) {
        setState(() {
          appSnackMessage(context, error.message!,true);
        });
      }
    }
  }
}
