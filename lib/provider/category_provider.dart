import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class CategoryProvider extends GetxController {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  List<String> _categories = [];
  List<String> get categories => _categories;
  var _selectedIndex = 0;

  CategoryProvider() {
    getCategories();
  }

  Future<void> getCategories() async {
    try {
      final QuerySnapshot categories =
          await _firebaseFirestore.collection('categories').get();
      _categories = categories.docs.map((doc) => doc.id).toList();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  int get selectedIndex => _selectedIndex;

  List<String> getCategoriesName() {
    return _categories;
  }

  void changeIndex(int index) {
    _selectedIndex = index;
  }
}
