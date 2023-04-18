import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frstproject/screens/signin.dart';

class OrganizationScreen extends StatefulWidget {
  const OrganizationScreen({super.key, required String userid});

  @override
  State<OrganizationScreen> createState() => _OrganizationScreenState();
}

class _OrganizationScreenState extends State<OrganizationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBodyBehindAppBar: true,
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      //   title: const Text(
      //     "Sign Up",
      //     style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      //   ),
      // ),
      body: Center(
          child: ElevatedButton(
        child: Text("logout Individual"),
        onPressed: () {
          FirebaseAuth.instance.signOut().then((value) {
            print("Signed out");
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SignScreen(
                          title: 'Sign in',
                        )));
          });
        },
      )),
    );
  }
}
