
import 'package:my_cart/models/date_model.dart';
import 'package:my_cart/models/product_model.dart';

const String collectionPurchase = 'Purchase';
const String purchaseFieldId = 'purchaseId';
const String purchaseFieldProduct = 'purchaseProduct';
const String purchaseFieldQuantity = 'quantity';
const String purchaseFieldPrice = 'price';
const String purchaseFieldDate = 'purchaseDate';

class PurchaseModel {
  String? purchaseId;
  ProductModel productModel;
  num purchaseQuantity;
  num purchasePrice;
  DateModel dateModel;

  PurchaseModel({
    this.purchaseId,
    required this.productModel,
    required this.purchaseQuantity,
    required this.purchasePrice,
    required this.dateModel,
  });

  Map<String, dynamic> toMap(){
    return <String, dynamic> {
      purchaseFieldId : purchaseId,
      purchaseFieldProduct : productModel.toMap(),
      purchaseFieldDate : dateModel.toMap(),
      purchaseFieldQuantity : purchaseQuantity,
      purchaseFieldPrice : purchasePrice,
    };
  }

  factory  PurchaseModel.fromMap(Map<String, dynamic> map){
    return PurchaseModel(
      purchaseId: map[purchaseFieldId],
        productModel: ProductModel.fromMap(map[purchaseFieldId]),
        purchaseQuantity: map[purchaseFieldQuantity],
        purchasePrice: map[purchaseFieldPrice],
        dateModel: DateModel.fromMap(map[purchaseFieldId]),
    );
  }
}
