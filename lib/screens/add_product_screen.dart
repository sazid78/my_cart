import 'package:flutter/material.dart';
import 'package:my_cart/widgets/widget_functions.dart';

class AddProductScreen extends StatefulWidget {
  static const String routeName = '/addProduct';

  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showSingleTextInputDialog(
              context: context, title: "Add Product", onSubmit: (value) {});
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        child: const Icon(Icons.add),
      ),
      body: const Center(child: Text("Add Product")),
    );
  }
}
