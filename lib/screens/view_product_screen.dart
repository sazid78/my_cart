import 'package:flutter/material.dart';

class ViewProductScreen extends StatefulWidget {
  static const String routeName = '/viewProduct';

  const ViewProductScreen({super.key});

  @override
  State<ViewProductScreen> createState() => _ViewProductScreenState();
}

class _ViewProductScreenState extends State<ViewProductScreen> {

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("View Product"),),
    );
  }
}
