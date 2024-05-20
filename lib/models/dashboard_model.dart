
import 'package:flutter/material.dart';
import 'package:my_cart/screens/add_product_screen.dart';
import 'package:my_cart/screens/categories_screen.dart';
import 'package:my_cart/screens/order_screen.dart';
import 'package:my_cart/screens/settings_screen.dart';
import 'package:my_cart/screens/user_screen.dart';
import 'package:my_cart/screens/view_product_screen.dart';

class DashboardModel {
  final String title;
  final IconData iconData;
  final String routeName;

  DashboardModel({required this.title, required this.iconData, required this.routeName});

}

 List<DashboardModel> dashboardModelList = [
  DashboardModel(title: "Add Product", iconData: Icons.add, routeName: AddProductScreen.routeName),
   DashboardModel(title: "View Product", iconData: Icons.card_giftcard, routeName: ViewProductScreen.routeName),
   DashboardModel(title: "Categories", iconData: Icons.category_outlined, routeName: CategoriesScreen.routeName),
   DashboardModel(title: "Orders", iconData: Icons.attach_money, routeName: OrderScreen.routeName),
   DashboardModel(title: "Users", iconData: Icons.person_outline, routeName: UserScreen.routeName),
   DashboardModel(title: "Settings", iconData: Icons.settings_outlined, routeName: SettingsScreen.routeName),
];