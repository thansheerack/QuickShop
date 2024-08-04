import 'dart:core';

class CartModeldb {
  String name;
  String id;
  String image;
  double price;
  int quantity;
  double total;
  String productId;

  CartModeldb({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.quantity,
    required this.total,
    required this.productId,
  });

  factory CartModeldb.fromMap(Map<String, dynamic> data) {
    return CartModeldb(
      name: data['name'],
      price: data['price'].toDouble,
      image: data['image'],
      id: data['id'],
      quantity: data['quantity'],
      total: data['total'].toDouble(),
      productId: data['productId'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'price': price,
      'image': image,
      'id': id,
      'quantity': quantity,
      'total': total * quantity,
      'productId': productId,
    };
  }
}
