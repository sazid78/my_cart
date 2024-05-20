import 'package:flutter/material.dart';

class UserScreen extends StatefulWidget {
  static const String routeName = '/users';

  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("users")),
    );
  }
}
