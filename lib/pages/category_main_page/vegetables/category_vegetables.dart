import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:quickshop/model/product_modeldb.dart';
import 'package:quickshop/pages/home/category_list/category_list.dart';
import 'package:quickshop/provider/product_provider.dart';
import 'package:quickshop/widgets/single_product.dart';

class CategoryVegetables extends StatelessWidget {
  const CategoryVegetables({super.key});

  @override
  Widget build(BuildContext context) {
    ProductProvider productProvider = ProductProvider.instance;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CategoryList(),
            Obx(() => Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    childAspectRatio: 0.63,
                    padding: const EdgeInsets.all(10),
                    mainAxisSpacing: 4,
                    crossAxisSpacing: 10,
                    children:
                        productProvider.products.map((ProductModeldb product) {
                      return SingleProductWidget(product: product);
                    }).toList(),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
