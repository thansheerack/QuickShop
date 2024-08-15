import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:quickshop/bottom_navbar/details_bottomnavbar.dart';
import 'package:quickshop/buttons/counter_button.dart';
import 'package:quickshop/model/product_modeldb.dart';
import 'package:quickshop/pages/shopping_cart/addto_cart.dart';
import 'package:quickshop/provider/cart_provider.dart';

class ProductDetailPage extends StatefulWidget {
  ProductDetailPage({
    Key? key,
    required this.productId,
  }) : super(key: key);

  final String productId;

  CartProvider cartController = CartProvider.instance;

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  final CollectionReference _database = FirebaseFirestore.instance
      .collection('categories')
      .doc('cid1')
      .collection('vegetables');
  Map<String, dynamic>? _productDetails;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _fetchProductDetails();
  }

  void _fetchProductDetails() async {
    try {
      final DocumentSnapshot snapshot =
          await _database.doc(widget.productId).get();
      if (snapshot.exists) {
        setState(() {
          _productDetails = snapshot.data() as Map<String, dynamic>;
          _loading = false;
        });
      } else {
        // Handle case when product is not found
        setState(() {
          _loading = false;
        });
      }
    } catch (e) {
      print('Error fetching product details: $e');
      setState(() {
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return Scaffold(
        appBar: AppBar(title: Text('Product Details')),
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (_productDetails == null) {
      return Scaffold(
        appBar: AppBar(title: Text('Product Details')),
        body: Center(child: Text('Product not found')),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text('Product Details')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 300,
              width: 400,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                child: Image.network(
                  _productDetails?['vImage'] ?? '',
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(
              '${_productDetails?['name'] ?? 'N/A'}',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text('${_productDetails?['details'] ?? 'N/A'}',
                style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'AED ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextSpan(
                        text: '${_productDetails?['price'] ?? '0.00'}',
                        style: TextStyle(
                          color: Color.fromARGB(255, 30, 102, 17),
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(' / ${_productDetails?['gram'] ?? '0.00'}',
                    style: TextStyle(fontSize: 18)),
                SizedBox(width: 80),
                CounterButton(),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: DetailsBottomnavbar(
        total: _productDetails?['price'] ?? '0.00',
      ),
    );
  }
}
