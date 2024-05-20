import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_cart/app.dart';
import 'package:my_cart/firebase_options.dart';
import 'package:my_cart/provider/product_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => ProductProvider())
  ], child: const MyApp()));
}
