import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:my_cart/models/product_model.dart';
import 'package:my_cart/provider/product_provider.dart';
import 'package:my_cart/screens/productRepurchaseScreen.dart';
import 'package:my_cart/utils/helper_function.dart';
import 'package:my_cart/widgets/snack_message.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import '../utils/constants.dart';

class ProductDetailsPage extends StatefulWidget {
  static const String routeName = '/product_details';
  const ProductDetailsPage({Key? key}) : super(key: key);

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  late ProductModel product;
  bool isInit = true;
  @override
  void didChangeDependencies() {
    if(isInit) {
      product = ModalRoute.of(context)!.settings.arguments as ProductModel;
    }
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.productName),
      ),
      body: Consumer<ProductProvider>(
        builder: (context, provider, child) => ListView(
          children: [
            CachedNetworkImage(
              width: double.infinity,
              height: 300,
              fit: BoxFit.cover,
              imageUrl: product.thumbnailImageUrl,
              placeholder: (context, url) =>
              const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) {
                return const Icon(Icons.error);
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                  onPressed: () => Navigator.pushNamed(
                    context,
                    ProductRepurchaseScreen.routeName,
                    arguments: product,
                  ),
                  child: const Text('Re-Purchase'),
                ),
                OutlinedButton(
                  onPressed: () {
                    _showPurchaseList(provider);
                  },
                  child: const Text('Purchase History'),
                ),
              ],
            ),
            ListTile(
              title: Text(product.productName, style: Theme.of(context).textTheme.headlineSmall,),
            ),
            ListTile(
              title: Text('Sale Price: $currencySymbol${product.salePrice}'),
              subtitle: Text('Discount: ${product.productDiscount}%'),
              trailing: Text('Stock: ${product.stock}', style: const TextStyle(fontSize: 20),),
            ),
            SwitchListTile(
              value: product.available,
              onChanged: (value) {
                setState(() {
                  product.available = !product.available;
                });
                provider.updateProductField(product.productId!, productFieldAvailable, value);
              },
              title: const Text('Available'),
            ),
            SwitchListTile(
              value: product.featured,
              onChanged: (value) {
                setState(() {
                  product.featured = !product.featured;
                });
                provider.updateProductField(product.productId!, productFieldFeatured, value);
              },
              title: const Text('Featured'),
            ),
            OutlinedButton(
              onPressed: _notifyUser,
              child: const Text('Notify Users'),
            )
          ],
        ),
      ),
    );
  }

  void _showPurchaseList(ProductProvider provider) {

    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Consumer<ProductProvider>(
            builder: (context, provider, child) {
              final purchaseList = provider.getPurchaseByProductId(product.productId!);
              return Container(
                margin: const EdgeInsets.all(20),
                child: ListView.builder(
                  //shrinkWrap: true,
                  itemCount: purchaseList.length,
                  itemBuilder: (context, index) {
                    final purchaseModel = purchaseList[index];
                    return ListTile(
                      title: Text(getFormattedDate(
                          purchaseModel.dateModel.timestamp.toDate())),
                      subtitle:
                      Text('$currencySymbol${purchaseModel.purchasePrice}'),
                      trailing: Text('Qty: ${purchaseModel.purchaseQuantity}'),
                    );
                  },
                ),
              );
            },
          );
        });
  }

  void _notifyUser() async {
    const url = 'https://fcm.googleapis.com/fcm/send';
    final header = {
      'Content-Type': 'application/json',
      'Authorization': 'key=$serverKey',
    };
    final body = {
      "to": "/topics/${NotificationSubscription.newProduct}",
      "notification": {
        "title": "New arrival!!!",
        "body": "Checkout this new Product ${product.productName}"
      },
      "data": {"key": "product", "value": product.productId}
    };
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: header,
        body: json.encode(body),
      );

      if(response.statusCode == 200) {
        appSnackMessage(context, 'Sent');
      } else {
        final map = json.decode(response.body);
        //print(map);
        appSnackMessage(context, 'Failed');
      }

    } catch (error) {
      print(error.toString());
    }
  }
}
