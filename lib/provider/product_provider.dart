import 'package:flutter/material.dart';
import 'package:my_cart/db/db_helper.dart';
import 'package:my_cart/models/category_model.dart';

class ProductProvider extends ChangeNotifier {
  List<CategoryModel> categoryList = [];

  Future<void> addCategory(String category) {
    final model = CategoryModel(categoryName: category);
    return DbHelper.addCategory(model);
  }

  getAllCategories() {
    DbHelper.getAllCategories().listen((snapshot) {
      categoryList = List.generate(snapshot.docs.length,
          (index) => CategoryModel.fromMap(snapshot.docs[index].data()));
      notifyListeners();
    });

  }
}
