import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


final _firestore = FirebaseFirestore.instance;

class FarmerDetails extends StatefulWidget {
  final String userid;

  const FarmerDetails({Key? key, required this.userid}) : super(key: key);

  @override
  State<FarmerDetails> createState() => _FarmerDetailsState();
}

Future<DocumentSnapshot<Map<String, dynamic>>> getUserData(
    String userId) async {
  return FirebaseFirestore.instance.collection('users').doc(userId).get();
}


Future<DocumentSnapshot<Map<String, dynamic>>> getfarmData(
    String userId) async {
  return FirebaseFirestore.instance.collection('farmdetails').doc(userId).get();
}
class _FarmerDetailsState extends State<FarmerDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
