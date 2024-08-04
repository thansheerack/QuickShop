import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CategoryProvider with ChangeNotifier {
  final FirebaseFirestore db = FirebaseFirestore.instance;

  String? _cid;
  String get cid => _cid!;
}
