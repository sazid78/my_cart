import 'package:flutter/material.dart';

class OrderScreen extends StatefulWidget {
  static const String routeName = '/orders';

  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("Orders")),
    );
  }
}
