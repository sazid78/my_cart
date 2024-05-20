import 'package:flutter/material.dart';
import 'package:my_cart/provider/product_provider.dart';
import 'package:my_cart/widgets/widget_functions.dart';
import 'package:provider/provider.dart';

class CategoriesScreen extends StatefulWidget {
  static const String routeName = '/categories';

  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showSingleTextInputDialog(
              context: context,
              title: "Category",
              onSubmit: (value) {
                Provider.of<ProductProvider>(context, listen: false)
                    .addCategory(value);
              });
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text("Categories"),
      ),
      body: Consumer<ProductProvider>(
        builder: (context, provider, child){
          return provider.categoryList.isEmpty ? const Center(child:  Text("No Category Found")) : ListView.builder(
            itemCount: provider.categoryList.length,
            itemBuilder: (context, index){
              final catModel = provider.categoryList[index];
              return  ListTile(
                title: Text(catModel.categoryName!),
              );
            },
          );
        },
      )
    );
  }
}
