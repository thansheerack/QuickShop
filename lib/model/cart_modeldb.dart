import 'package:quickshop/model/product_modeldb.dart';

class CartModeldb {
  final ProductModeldb product;
  int quantity;

  CartModeldb({
    required this.product,
    required this.quantity,
  });

  factory CartModeldb.fromMap(Map<String, dynamic> data) {
    return CartModeldb(
      quantity: data['quantity']?.toInt() ?? 0,
      product: ProductModeldb.fromMap(data['product']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'quantity': quantity,
      'product': product.toMap(),
    };
  }

  CartModeldb copyWith({
    ProductModeldb? product,
    int? quantity,
  }) {
    return CartModeldb(
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
    );
  }

  @override
  String toString() => 'CartModeldb(product: $product, quantity: $quantity)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CartModeldb &&
        other.product == product &&
        other.quantity == quantity;
  }

  @override
  int get hashCode => product.hashCode ^ quantity.hashCode;
}
