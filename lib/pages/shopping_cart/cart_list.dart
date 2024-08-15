import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickshop/provider/cart_provider.dart';

class CartList extends StatelessWidget {
  CartList({Key? key}) : super(key: key);

  CartProvider cartController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 20,
              ),
              child: Obx(
                () => ListView.builder(
                    itemCount: cartController.cartItems.length,
                    itemBuilder: (context, index) {
                      var currentItem = cartController.cartItems[index];
                      return Card(
                        clipBehavior: Clip.none,
                        color: Colors.amberAccent,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Image.asset(
                              currentItem.product.vImage,
                              width: 100,
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child:
                                      Text("Quantity: ${currentItem.quantity}"),
                                ),
                                IconButton(
                                  onPressed: () {
                                    cartController
                                        .removeThisItemFromList(currentItem);
                                  },
                                  icon: const Icon(Icons.delete),
                                ),
                              ],
                            )
                          ],
                        ),
                      );
                    }),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.amberAccent,
                      borderRadius: BorderRadius.circular(40)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    child: Obx(() => Text(
                          "Total Amount:\n ${cartController.totalAmount.value.toString()}",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.amberAccent,
                      borderRadius: BorderRadius.circular(30)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Obx(() => Text(
                          "Total Quantity:\n ${cartController.totalQty.value.toString()}",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      title: Text(
        "Item List",
        style: TextStyle(
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
      leading: IconButton(
        onPressed: () {
          Get.back();
        },
        icon: Icon(
          Icons.arrow_back_ios,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }
}
