import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:my_cart/db/db_helper.dart';
import 'package:my_cart/models/category_model.dart';
import 'package:my_cart/models/product_model.dart';
import 'package:my_cart/models/purchase_model.dart';

class ProductProvider extends ChangeNotifier {
  List<CategoryModel> categoryList = [];
  List<ProductModel> productList = [];

  Future<void> addCategory(String category) {
    final model = CategoryModel(categoryName: category);
    return DbHelper.addCategory(model);
  }

  Future<void> addProduct(ProductModel productModel, PurchaseModel purchaseModel) {
    return DbHelper.addProduct(productModel,purchaseModel);
  }


  getAllCategories() {
    DbHelper.getAllCategories().listen((snapshot) {
      categoryList = List.generate(snapshot.docs.length,
          (index) => CategoryModel.fromMap(snapshot.docs[index].data()));
      notifyListeners();
    });

  }

  Future<String> uploadImageAndGetDownloadUrl(String path) async{
    final imageName = DateTime.now().millisecondsSinceEpoch;
    final imageRef = FirebaseStorage.instance.ref().child("Pictures/$imageName");
    final uploadTask = imageRef.putFile(File(path));
    final snapshot = await uploadTask.whenComplete(() => null);
    return snapshot.ref.getDownloadURL();
  }
}
