import 'package:flutter/material.dart';

class UserRole {
  String? email;
  String? role;
  String uid = " ";
  String? name;
  String? phNo;

// receiving data
  UserRole({uid, this.email, this.role, this.name, this.phNo});
  factory UserRole.fromMap(map) {
    return UserRole(
        uid: map['uid'],
        email: map['email'],
        role: map['role'],
        name: map['name'],
        phNo: map['phNo']);
  }
// sending data
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'role': role,
      'name': name,
      'phNo': phNo
    };
  }
}

class Farmdetails {
  String uid = " ";
  String? city;
  String? address;
  String? crop;
  String? price;
  String? img;

// receiving data
  Farmdetails({this.city, this.address, this.crop, this.price, this.img, uid});
  factory Farmdetails.fromMap(map) {
    return Farmdetails(
        uid: map['uid'],
        city: map['city'],
        address: map['address'],
        crop: map['crop'],
        price: map['price'],
        img: map['img']);
  }
// sending data
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'city': city,
      'address': address,
      'crop': crop,
      'price': price,
      'img': img
    };
  }
}
