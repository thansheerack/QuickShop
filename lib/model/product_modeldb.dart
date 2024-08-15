import 'package:equatable/equatable.dart';

class ProductModeldb extends Equatable {
  final String name;
  final String vImage;
  final String vid;
  final String gram;
  final double price;
  final String details;
  final int quantity;

  ProductModeldb({
    required this.vid,
    required this.vImage,
    required this.name,
    required this.gram,
    required this.price,
    required this.details,
    this.quantity = 0,
  });

  //from map
  factory ProductModeldb.fromMap(Map<String, dynamic> data) {
    return ProductModeldb(
      name: data['name'],
      vImage: data['vImage'],
      vid: data['vid'],
      gram: data['gram'],
      price: double.parse(data['price'].toString()),
      details: data['details'],
      quantity: int.parse(data['quantity'].toString()),
    );
  }

  //to map
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'vImage': vImage,
      'vid': vid,
      'gram': gram,
      'price': price,
      'details': details,
      'quantity': quantity,
    };
  }

  ProductModeldb copyWith({
    name,
    vImage,
    vid,
    gram,
    price,
    details,
    quantity,
  }) {
    return ProductModeldb(
      name: name ?? this.name,
      vImage: vImage ?? this.vImage,
      vid: vid ?? this.vid,
      gram: gram ?? this.gram,
      price: price ?? this.price,
      details: details ?? this.details,
      quantity: quantity ?? this.quantity,
    );
  }

  @override
  List<Object> get props => [name, vImage, vid, gram, price, details, quantity];
}
