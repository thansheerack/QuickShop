import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickshop/model/product_modeldb.dart';
import 'package:quickshop/pages/shopping_cart/addto_cart.dart';
import 'package:quickshop/pages/shopping_cart/cart_list.dart';
import 'package:quickshop/pages/shopping_cart/shopping_cart.dart';
import 'package:quickshop/provider/cart_provider.dart';

class DetailsBottomnavbar extends StatelessWidget {
  DetailsBottomnavbar({
    Key? key,
    required this.total,
  }) : super(key: key);

  final String total;

  CartProvider cartProvider = CartProvider.instance;

  @override
  Widget build(BuildContext context) {
    cartProvider.initliaseQuantity();
    return Container(
      height: 80,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 30, 102, 17),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            alignment: Alignment.center,
            height: 60,
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'AED  ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextSpan(
                    text: total,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 60),
          ElevatedButton(
            onPressed: () {
              // Implement add to cart
            },
            child: Row(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.shopping_cart_outlined,
                    color: Color.fromARGB(255, 30, 102, 17),
                    size: 35,
                  ),
                  onPressed: () {
                    // Implement favorite
                  },
                ),
                SizedBox(width: 10),
                Text(
                  'Add to Cart',
                  style: TextStyle(
                    color: Color.fromARGB(255, 30, 102, 17),
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
