const String categoryFieldName = 'categoryName';
const String categoryFieldId= 'categoryId';
const String collectionCategory = 'Categories';

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
}

