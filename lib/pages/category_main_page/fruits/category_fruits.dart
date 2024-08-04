import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickshop/model/product_modeldb.dart';
import 'package:quickshop/provider/product_provider.dart';
import 'package:quickshop/widgets/single_product.dart';

class CategoryFruits extends StatelessWidget {
  const CategoryFruits({super.key});

  @override
  Widget build(BuildContext context) {
    ProductProvider productProvider = ProductProvider.instance;
    return SafeArea(
      child: Scaffold(
        body: Obx(() => GridView.count(
              crossAxisCount: 2,
              childAspectRatio: 0.63,
              padding: const EdgeInsets.all(10),
              mainAxisSpacing: 4,
              crossAxisSpacing: 10,
              children: productProvider.products.map((ProductModeldb product) {
                return SingleProductWidget(product: product);
              }).toList(),
            )),
      ),
    );
  }
}
