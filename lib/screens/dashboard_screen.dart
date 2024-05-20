import 'package:flutter/material.dart';
import 'package:my_cart/auth/auth_service.dart';
import 'package:my_cart/models/dashboard_model.dart';
import 'package:my_cart/provider/product_provider.dart';
import 'package:my_cart/screens/dashboard_item_view.dart';
import 'package:my_cart/screens/splash_screen.dart';
import 'package:provider/provider.dart';

class DashboardScreen extends StatefulWidget {
  static const String routeName = '/dashboard';
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}


class _DashboardScreenState extends State<DashboardScreen> {
  bool isFirst = true;
  @override
  void didChangeDependencies() {
    if(isFirst){
      Provider.of<ProductProvider>(context,listen: false).getAllCategories();
    }
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("DashBoard"),
        actions: [
          IconButton(onPressed: () {
            AuthService.logoutAdmin().then((value) => Navigator.pushReplacementNamed(context, SplashScreen.routeName));
          }, icon: Icon(Icons.logout_outlined))
        ],
      ),
      body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            childAspectRatio: 1.0
          ),
          itemCount: dashboardModelList.length,
          itemBuilder: (context, index) {
            final model = dashboardModelList[index];
            return DashboardItemView(model: model);
          }
      )
    );
  }
}
