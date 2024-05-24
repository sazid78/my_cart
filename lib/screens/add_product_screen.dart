import 'dart:async';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_cart/models/category_model.dart';
import 'package:my_cart/models/date_model.dart';
import 'package:my_cart/models/product_model.dart';
import 'package:my_cart/models/purchase_model.dart';
import 'package:my_cart/provider/product_provider.dart';
import 'package:my_cart/utils/helper_function.dart';
import 'package:my_cart/widgets/snack_message.dart';
import 'package:provider/provider.dart';

class AddProductScreen extends StatefulWidget {
  static const String routeName = '/addProduct';

  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final _productNameTEcontroller = TextEditingController();
  final _productShortDescriptionTEcontroller = TextEditingController();
  final _productLongDescriptionTEcontroller = TextEditingController();
  final _purchasePriceTEcontroller = TextEditingController();
  final _salePriceTEcontroller = TextEditingController();
  final _quantityTEcontroller = TextEditingController();
  final _discountTEcontroller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  late ProductProvider _productProvider;
  CategoryModel? categoryModel;
  String? thumbnailImageLocalPath;
  DateTime? purchaseDate;
  late StreamSubscription<ConnectivityResult> subscription;
  bool _isConnected = true;

  @override
  void initState() {
    isConnectedToInternet().then((value) {
      setState(() {
        _isConnected = value;
      });
    });
    subscription = Connectivity().onConnectivityChanged.listen((result) {
      setState(() {
        _isConnected = result == ConnectivityResult.wifi ||
            result == ConnectivityResult.mobile;
      });
    });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _productProvider = Provider.of<ProductProvider>(context, listen: false);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
          title: const Text("Add Product"),
          actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.done))],
        ),
        body: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              if (!_isConnected)
                const ListTile(
                  tileColor: Colors.red,
                  title: Text(
                    "No internet connectivity",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              Card(
                color: Colors.deepPurple,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                       Card(
                        child: thumbnailImageLocalPath == null ? const Icon(
                          Icons.photo,color: Colors.deepPurple,
                          size: 100,
                        ) : Image.file(File(thumbnailImageLocalPath!),width: 100,height: 100,fit: BoxFit.cover,),

                      ),
                      Wrap(
                        children: [
                          TextButton.icon(
                              onPressed: () {
                                _getImage(ImageSource.camera);
                              },
                              icon: const Icon(
                                Icons.camera,
                                color: Colors.white,
                              ),
                              label: const Text(
                                "Open Camera",
                                style: TextStyle(color: Colors.white),
                              )),
                          TextButton.icon(
                              onPressed: () {
                                _getImage(ImageSource.gallery);
                              },
                              icon: const Icon(
                                Icons.file_copy,
                                color: Colors.white,
                              ),
                              label: const Text(
                                "Open Gallery",
                                style: TextStyle(color: Colors.white),
                              )),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16,),
              Consumer<ProductProvider>(
                builder: (context,provider,child) {
                 return DropdownButtonFormField<CategoryModel>(
                    value: categoryModel,
                      isExpanded: true,
                      validator: (value) {
                      if(value == null){
                        return "Please select a category";
                      }
                      return null;
                      },
                      hint: const Text("Select Category"),
                        items: provider.categoryList.map((catModel) => DropdownMenuItem<CategoryModel>(
                          value: catModel,
                            child: Text(catModel.categoryName!))).toList(),
                      onChanged: (value){
                    setState(() {
                      categoryModel = value;
                    });
                  }
                  );
                },
              ),
              const SizedBox(height: 10,),
              TextFormField(
                controller: _productNameTEcontroller,
                validator: (value){
                  if(value == null || value.isEmpty){
                    return 'This field must not be empty';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  labelText: "Enter Product Name"
                ),
              ),
              const SizedBox(height: 10,),
              TextFormField(
                controller: _productShortDescriptionTEcontroller,
                validator: (value){
                  if(value == null || value.isEmpty){
                    return 'This field must not be empty';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                    labelText: "Enter Short Description (optional)"
                ),
              ),
              const SizedBox(height: 10,),
              TextFormField(
                controller: _productLongDescriptionTEcontroller,
                maxLines: 2,
                validator: (value){
                  if(value == null || value.isEmpty){
                    return 'This field must not be empty';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                    labelText: "Enter Long Description (optional)"
                ),
              ),
              const SizedBox(height: 10,),
              TextFormField(
                controller: _purchasePriceTEcontroller,
                validator: (value){
                  if(value == null || value.isEmpty){
                    return 'This field must not be empty';
                  }
                  if(num.parse(value) <= 0){
                    return 'Price should be greater than 0';
                  }
                  return null;
                },
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    labelText: "Enter Purchase Price"
                ),
              ),
              const SizedBox(height: 10,),
              TextFormField(
                controller: _salePriceTEcontroller,
                validator: (value){
                  if(value == null || value.isEmpty){
                    return 'This field must not be empty';
                  }
                  if(num.parse(value) <= 0){
                    return 'Price should be greater than 0';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                    labelText: "Enter sale price"
                ),
              ),
              const SizedBox(height: 10,),
              TextFormField(
                controller: _quantityTEcontroller,
                validator: (value){
                  if(value == null || value.isEmpty){
                    return 'This field must not be empty';
                  }
                  if(num.parse(value) <= 0){
                    return 'Quantity should be greater than 0';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                    labelText: "Enter Quantity"
                ),
              ),
              const SizedBox(height: 10,),
              TextFormField(
                controller: _discountTEcontroller,
                validator: (value){
                  if(value == null || value.isEmpty){
                    return 'This field must not be empty';
                  }
                  if(num.parse(value) < 0){
                    return 'Discount should not be a negative value';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                    labelText: "Enter Discount"
                ),
              ),
              const SizedBox(height: 10,),
              Card(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton.icon(onPressed: (){
                      _selectDate();
                    }, icon: const Icon(Icons.calendar_month_outlined), label: const Text("Select Purchase Date")),
                    Text(purchaseDate == null ? "No date chosen" : getFormattedDate(purchaseDate!))
                  ],
                ),
              ),
              const SizedBox(height: 30,),
              SizedBox(
                height: 50,
                child: ElevatedButton(onPressed: () {
                  _saveProduct();
                }, child: const Text("Save")),
              )
            ],
          ),
        ));
  }

  void _selectDate() async {
    final dt = await showDatePicker(
        context: context,
        firstDate: DateTime(DateTime.now().year).subtract(const Duration(days: 30)),
        lastDate: DateTime.now(),
    );
    if(dt != null){
      setState(() {
        purchaseDate = dt;
      });
    }
  }

  void _getImage(ImageSource imageSource) async {
    final pickedImage = await ImagePicker().pickImage(source: imageSource,imageQuality: 70);
    if(pickedImage != null){
      setState(() {
        thumbnailImageLocalPath = pickedImage.path;
      });
    }
  }

  void _saveProduct() async {
    if (thumbnailImageLocalPath == null){
      appSnackMessage(context, "Please select a product image");
      return;
    }
    if(purchaseDate == null){
      appSnackMessage(context, "Please select purchase date");
      return;
    }
    if(_formKey.currentState!.validate()){
      EasyLoading.show(status: "Please wait", dismissOnTap: false);
      try {
        final downloadUrl = await _productProvider.uploadImageAndGetDownloadUrl(thumbnailImageLocalPath!);
        final productModel = ProductModel(
            productName: _productNameTEcontroller.text,
            category: categoryModel!,
            shortDescription: _productShortDescriptionTEcontroller.text,
            longDescription: _productLongDescriptionTEcontroller.text,
            salePrice: num.parse(_salePriceTEcontroller.text),
            stock: num.parse(_quantityTEcontroller.text),
            thumbnailImageUrl:  downloadUrl
        );
        final purchaseModel = PurchaseModel(
            productModel: productModel,
            purchaseQuantity: num.parse(_purchasePriceTEcontroller.text),
            purchasePrice: num.parse(_purchasePriceTEcontroller.text),
            dateModel: DateModel(
                timestamp: Timestamp.fromDate(purchaseDate!),
                day: purchaseDate!.day,
                month: purchaseDate!.month,
                year: purchaseDate!.year
            )
        );
        await _productProvider.addProduct(productModel, purchaseModel);
        appSnackMessage(context, "Saved Successfully");
        _resetFields();
        EasyLoading.dismiss();
      } catch(error) {
        appSnackMessage(context, "Something went wrong ${error.toString()}");
        EasyLoading.dismiss();
        print(error.toString());
      }
    }
  }

  @override
  void dispose() {
    subscription.cancel();
    _productNameTEcontroller.dispose();
    _discountTEcontroller.dispose();
    _quantityTEcontroller.dispose();
    _salePriceTEcontroller.dispose();
    _purchasePriceTEcontroller.dispose();
    _productLongDescriptionTEcontroller.dispose();
    _productShortDescriptionTEcontroller.dispose();
    super.dispose();
  }

  void _resetFields() {
    setState(() {
      _productNameTEcontroller.clear();
      _discountTEcontroller.clear();
      _quantityTEcontroller.clear();
      _salePriceTEcontroller.clear();
      _purchasePriceTEcontroller.clear();
      _productLongDescriptionTEcontroller.clear();
      _productShortDescriptionTEcontroller.clear();
      categoryModel = null;
      purchaseDate = null;
      thumbnailImageLocalPath = null;
    });
  }
}
