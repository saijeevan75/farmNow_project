import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:frstproject/screens/signin.dart';

final _firestore = FirebaseFirestore.instance;

class IndiviScreen extends StatefulWidget {
  final String userid;
  const IndiviScreen({Key? key, required this.userid}) : super(key: key);

  @override
  State<IndiviScreen> createState() => _IndiviScreenState();
}

Future<DocumentSnapshot<Map<String, dynamic>>> getUserData(
    String userId) async {
  return FirebaseFirestore.instance.collection('users').doc(userId).get();
}

class _IndiviScreenState extends State<IndiviScreen> {
  Map<String, dynamic>? userData;

  @override
  void initState() {
    super.initState();
    _getUserData();
  }

  Future<void> _getUserData() async {
    DocumentSnapshot<Map<String, dynamic>> snapshot =
        await getUserData(widget.userid);
    setState(() {
      userData = snapshot.data();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (userData == null) CircularProgressIndicator(),
            if (userData != null)
              Column(
                children: [
                  Text("Welcome ${userData!['name']}!"),
                  ElevatedButton(
                    child: Text("Logout ${userData!['role']}"),
                    onPressed: () {
                      FirebaseAuth.instance.signOut().then((value) {
                        print("Signed out");
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignScreen(
                              title: 'Sign in',
                            ),
                          ),
                        );
                      });
                    },
                  ),
                  ElevatedButton(
                      onPressed: () {
                        
                      }, child: const Text("load farms")),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
