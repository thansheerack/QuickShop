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
}
