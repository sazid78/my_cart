import 'package:my_cart/models/category_model.dart';

const String collectionProduct = 'Products';
const String productFieldId = 'ProductId';
const String productFieldName = 'ProductName';
const String productFieldCategory = 'Category';
const String productFieldShortDescription = 'shortDescription';
const String productFieldLongDescription = 'longDescription';
const String productFieldSalePrice = 'salePrice';
const String productFieldStock = 'stock';
const String productFieldAvgRating = 'avgRating';
const String productFieldDiscount = 'discount';
const String productFieldThumbnail = 'thumbnail';
const String productFieldImages = 'images';
const String productFieldAvailable = 'available';
const String productFieldFeatured = 'featured';

class ProductModel {
  String? productId;
  String productName;
  CategoryModel category;
  String? shortDescription;
  String? longDescription;
  num salePrice;
  num stock;
  num avgRating;
  num productDiscount;
  String thumbnailImageUrl;
  // List<String> additionalImages;
  bool available;
  bool featured;

  ProductModel(
      {this.productId,
      required this.productName,
      required this.category,
      this.shortDescription,
      this.longDescription,
      required this.salePrice,
      required this.stock,
      this.avgRating = 0.0,
      this.productDiscount = 0,
      required this.thumbnailImageUrl,
      // required this.additionalImages,
      this.available = true,
      this.featured = false});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      productFieldId: productId,
      productFieldName: productName,
      productFieldCategory: category.toMap(),
      productFieldShortDescription: shortDescription,
      productFieldLongDescription: longDescription,
      productFieldDiscount: productDiscount,
      productFieldSalePrice: salePrice,
      productFieldStock: stock,
      productFieldAvgRating: avgRating,
      productFieldThumbnail: thumbnailImageUrl,
      // productFieldImages: additionalImages,
      productFieldAvailable: available,
      productFieldFeatured: featured,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) => ProductModel(
      productId: map[productFieldId],
      productName: map[productFieldName],
      category: CategoryModel.fromMap(map[productFieldCategory]),
      shortDescription: map[productFieldShortDescription],
      longDescription: map[productFieldLongDescription],
      salePrice: map[productFieldSalePrice],
      stock: map[productFieldStock],
      avgRating: map[productFieldAvgRating],
      productDiscount: map[productFieldDiscount],
      thumbnailImageUrl: map[productFieldThumbnail],
      // additionalImages: map[productFieldId] == null
      //     ? ['', '', '']
      //     : (map[productFieldImages] as List).map((e) => e as String).toList(),
      available: map[productFieldAvailable],
      featured: map[productFieldFeatured]);
}
