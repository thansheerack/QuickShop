class ProductModeldb {
  String name;
  String vImage;
  String vid;
  String gram;
  String price;

  ProductModeldb({
    required this.vid,
    required this.vImage,
    required this.name,
    required this.gram,
    required this.price,
  });

  //from map
  factory ProductModeldb.fromMap(Map<String, dynamic> data) {
    return ProductModeldb(
      name: data['name'],
      vImage: data['vImage'],
      vid: data['vid'],
      gram: data['gram'],
      price: data['price'],
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
    };
  }
}
