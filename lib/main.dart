import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quickshop/model/categories_data.dart';
import 'package:quickshop/pages/get_started.dart';
import 'package:quickshop/provider/auth_provider.dart';
import 'package:quickshop/provider/cart_provider.dart';
import 'package:quickshop/provider/category_provider.dart';
import 'package:get/get.dart';
import 'package:quickshop/provider/product_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  createDocuments();
  Get.put(ProductProvider());
  Get.put(CategoryProvider());
  Get.put(CartProvider());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
          useMaterial3: true,
        ),
        home: const GetStarted(),
      ),
    );
  }
}
