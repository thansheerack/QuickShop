import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:quickshop/model/cart_modeldb.dart';
import 'package:quickshop/model/product_modeldb.dart';

class CartProvider extends GetxController {
  static CartProvider instance = Get.find();
  var numOfItems = 1.obs;

  var totalQty = 0.obs;
  var totalAmount = 0.obs;

  var cartItems = <CartModeldb>[].obs;

  void removeItem() {
    if (numOfItems.value > 1) {
      numOfItems.value--;
    }
  }

  void addItem() {
    numOfItems.value++;
  }

  void addItemInCart(ProductModeldb product) {
    final index = cartItems.indexWhere((element) => element.product == product);

    if (index >= 0) {
      //here product already in list, so will upadte qunatity only
      cartItems[index] = CartModeldb(
        product: product,
        quantity: (numOfItems.value + cartItems[index].quantity),
      );
    } else {
      cartItems.add(CartModeldb(product: product, quantity: numOfItems.value));
    }

    totalQty.value = totalQty.value + numOfItems.value;

    totalAmount.value =
        totalAmount.value + ((product.price as int) * numOfItems.value);

    numOfItems.value = 1;
  }

  void initliaseQuantity() {
    numOfItems.value = 1;
  }

  void removeThisItemFromList(CartModeldb currentItem) {
    cartItems.remove(currentItem);

    totalQty.value = totalQty.value - currentItem.quantity;
    totalAmount.value = totalAmount.value -
        ((currentItem.product.price as int) * currentItem.quantity);
  }
}
