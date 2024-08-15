import 'package:flutter/material.dart';
import 'package:quickshop/model/product_modeldb.dart';
import 'package:quickshop/provider/cart_provider.dart';

class AddToCartPage extends StatelessWidget {
  AddToCartPage({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ProductModeldb product;

  CartProvider cartProvider = CartProvider.instance;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          InkWell(
            onTap: () {
              cartProvider.addItemInCart(product);
            },
            child: Container(
              margin: EdgeInsets.only(right: 10),
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                color: Colors.amberAccent,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.grey.withOpacity(
                    0.5,
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.add,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Expanded(
            child: SizedBox(
              height: 50,
              child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all(
                    Color(
                      0xFF3D82AE,
                    ),
                  ),
                ),
                child: Text(
                  "Buy Now".toUpperCase(),
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
