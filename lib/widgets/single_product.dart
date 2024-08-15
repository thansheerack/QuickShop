import 'package:flutter/material.dart';
import 'package:quickshop/model/product_modeldb.dart';
import 'package:quickshop/pages/Detail_page/product_page.dart';
import 'package:quickshop/pages/shopping_cart/addto_cart.dart';

class SingleProductWidget extends StatelessWidget {
  final ProductModeldb product;
  const SingleProductWidget({super.key, required this.product});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailPage(
              productId: product.vid,
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(.5),
                  offset: const Offset(3, 2),
                  blurRadius: 7)
            ]),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    product.vImage,
                    width: double.infinity,
                    height: 170,
                  )),
            ),
            Text(
              product.name,
              maxLines: 1,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              ' ${product.gram}',
              maxLines: 1,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: RichText(
                    text: TextSpan(children: [
                      const TextSpan(
                          text: 'AED',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w500)),
                      TextSpan(
                          text: ' ${product.price}',
                          style: const TextStyle(
                              color: Colors.green,
                              fontSize: 22,
                              fontWeight: FontWeight.bold)),
                    ]),
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                IconButton(
                    icon: const Icon(Icons.add_shopping_cart),
                    onPressed: () {
                      // Implement add to cart
                    })
              ],
            ),
          ],
        ),
      ),
    );
  }
}
