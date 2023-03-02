class UserModel {
  String? uid;
  String? email;
  String? firstName;
  String? secondName;

  UserModel(
      {required this.uid,
      required this.email,
      required this.firstName,
      required this.secondName});

  // Receiving Data from server
  factory UserModel.forMap(map) {
    return UserModel(
        uid: map["uid"],
        email: map["email"],
        firstName: map["firstName"],
        secondName: map["secondName"],);
  }

  // Sending Data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'firstName': firstName,
      'secondName': secondName,
    };
  }
}
