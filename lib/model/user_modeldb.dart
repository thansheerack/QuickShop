class UserModeldb {
  String name;
  String email;
  String phoneNumber;
  String profilePic;
  String created_at;
  String uid;
  //List<CartModeldb> cart = [];

  UserModeldb({
    required this.uid,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.created_at,
    required this.profilePic,
    //required this.cart,
  });

  //from map
  factory UserModeldb.fromMap(Map<String, dynamic> map) {
    return UserModeldb(
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
      profilePic: map['profilePic'] ?? '',
      created_at: map['created_at'] ?? '',
      uid: map['uid'] ?? '',
      //cart: map['cart'] ?? [],
    );
  }

  //to map
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'profilePic': profilePic,
      'created_at': created_at,
      //'cart': cart,
    };
  }
}
