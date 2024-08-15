import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:quickshop/model/product_modeldb.dart';

class ProductProvider extends GetxController {
  static ProductProvider instance = Get.find();
  RxList<ProductModeldb> products = RxList<ProductModeldb>([]);
  String collection = 'vegetables';

  @override
  void onReady() {
    super.onReady();
    products.bindStream(getAllProducts());
  }

  Stream<List<ProductModeldb>> getAllProducts() {
    products.value = List.from(products.value)
      ..sort((a, b) => a.name!.compareTo(b.name!));

    FirebaseFirestore db = FirebaseFirestore.instance;
    return db
        .collection('categories')
        .doc('cid1')
        .collection(collection)
        .snapshots()
        .map((query) => query.docs
            .map((item) => ProductModeldb.fromMap(item.data()))
            .toList());
  }

  void search(String query) {
    products.value = List.from(products.value)
      ..sort((a, b) => a.name!.compareTo(b.name!));
    if (query.isNotEmpty) {
      products.value = products
          .where((product) =>
              product.name!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
  }

  void clear() {
    products.value = List.from(products.value)
      ..sort((a, b) => a.name!.compareTo(b.name!));
  }
}
