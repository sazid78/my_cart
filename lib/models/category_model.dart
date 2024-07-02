const String categoryFieldName = 'categoryName';
const String categoryFieldId= 'categoryId';
const String collectionCategory = 'Categories';
const String categoryFieldProductCount='productCount';

class CategoryModel {
  String? categoryId;
  String? categoryName;

  CategoryModel({this.categoryName, this.categoryId});

  Map<String,dynamic> toMap(){
    return <String,dynamic> {
      categoryFieldId : categoryId,
      categoryFieldName: categoryName
    };
  }

  factory CategoryModel.fromMap(Map<String,dynamic> map) => CategoryModel(
    categoryId: map[categoryFieldId],
    categoryName: map[categoryFieldName]
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is CategoryModel &&
              runtimeType == other.runtimeType &&
              categoryId == other.categoryId;

  @override
  int get hashCode => categoryId.hashCode;
}

