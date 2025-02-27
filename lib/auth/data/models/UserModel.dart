import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  String? name;
  String? phone;
  String? email;
  String? uid;
  String? role;
  UserModel({this.name, this.email, this.phone, this.uid, this.role});

  factory UserModel.fromFirebaseUser(User user) {
    return UserModel(
      uid: user.uid,
      email: user.email, 
      name: user.displayName, 
      phone: user.phoneNumber,
      role: 'user', 
    );
  }
  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    uid = json['uid'];
    role = json['role'];
  }
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'uid': uid,
      'role': role,
    };
  }
}
