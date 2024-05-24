import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_cart/models/category_model.dart';
import 'package:my_cart/models/product_model.dart';
import 'package:my_cart/models/purchase_model.dart';

class DbHelper {
  static const String collectionAdmin = 'admin';
  static FirebaseFirestore _db = FirebaseFirestore.instance;

  static Future<bool> isAdmin(String uid) async {
    final snapshot = await _db.collection(collectionAdmin).doc(uid).get();
    return snapshot.exists;
  }

  static Future<void> addCategory(CategoryModel model) async {
    final docRef = _db.collection(collectionCategory).doc();
    model.categoryId = docRef.id;
    return docRef.set(model.toMap());
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>> getAllCategories() =>
      _db.collection(collectionCategory).snapshots();

  static Future<void> addProduct(ProductModel productModel, PurchaseModel purchaseModel) {
    final wb = _db.batch();
    final productDoc = _db.collection(collectionProduct).doc();
    final purchaseDoc = _db.collection(collectionPurchase).doc();
    productModel.productId = productDoc.id;
    purchaseModel.purchaseId = purchaseDoc.id;
    purchaseModel.productModel.productId = productDoc.id;
    wb.set(productDoc,productModel.toMap());
    wb.set(purchaseDoc,purchaseModel.toMap());
    return wb.commit();
  }

}
