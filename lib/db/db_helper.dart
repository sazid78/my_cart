import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_cart/models/category_model.dart';

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

}
