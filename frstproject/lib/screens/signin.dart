import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frstproject/screens/farmer_home.dart';
import 'package:frstproject/screens/individual/home.dart';
import 'package:frstproject/screens/individual_home.dart';
import 'package:frstproject/screens/signup.dart';
import 'package:frstproject/utils/colors_util.dart';

import '../reusable_widgets/reusable.dart';
import 'organization_home.dart';



final _auth = FirebaseAuth.instance;
final _firestore = FirebaseFirestore.instance;

final FirebaseAuth auth = FirebaseAuth.instance;

class SignScreen extends StatefulWidget {
  const SignScreen({Key? key, required String title}) : super(key: key);

  @override
  State<SignScreen> createState() => _SignScreenState();
}

class _SignScreenState extends State<SignScreen> {
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  String uid = " ";

  bool loading = false;
  String message =  " " ;


  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          hexStringToColor("#50C878"),
          hexStringToColor("#50C878"),
          hexStringToColor("#1CAC78"),
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: SingleChildScrollView(
            child: Form(
          key: _formkey,
          child: Padding(
              padding: EdgeInsets.fromLTRB(
                  20, MediaQuery.of(context).size.height * 0.2, 20, 0),
              child: Column(
                children: <Widget>[
                  logoWidget("assets/images/farmnow.png"),
                  const SizedBox(
                    height: 20,
                  ),
                  reusableTextFieldEmail("Enter UserName", Icons.person_outline,
                      false, _emailTextController),
                  const SizedBox(
                    height: 20,
                  ),
                  reusableTextFieldPassword(
                    "Enter Password",
                    Icons.lock,
                    true,
                    _passwordTextController,
                  ),

                  // SizedBox(
                  //   height: 20,
                  // ),
                  // Text(
                  //   message,
                  //   style: TextStyle(
                  //       color: hexStringToColor("#50C878"),
                  //       fontWeight: FontWeight.bold),
                  // ),
                  const SizedBox(
                    height: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      Future.delayed(const Duration(seconds: 0), (){
                        setState(() {
                          loading = true;
                          
                        });
                      });
                      
                    },
                    child: pageButton(context, true, () async {
                      if (_formkey.currentState!.validate()) {
                        if (loading == true) {const CircularProgressIndicator();}

                        try {
                          UserCredential userCredential =
                              await _auth.signInWithEmailAndPassword(
                            email: _emailTextController.text,
                            password: _passwordTextController.text,
                          );
                  
                          String uid = userCredential.user?.uid ?? 'uid';
                  
                          DocumentSnapshot userDoc = await FirebaseFirestore
                              .instance
                              .collection('users')
                              .doc(uid)
                              .get();
                          Map<String, dynamic> userData =
                              userDoc.data() as Map<String, dynamic>;
                          String role = userData['role'];
                          if (role == "Farmer") {
                            // ignore: use_build_context_synchronously
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        HomeScreen(userid: uid)));
                          }
                          if (role == "Individual") {
                            // ignore: use_build_context_synchronously
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const HomePage()));
                          }
                          if (role == "Organization") {
                            // ignore: use_build_context_synchronously
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        OrganizationScreen(userid: uid)));
                          }
                        } on FirebaseAuthException catch (e) {
                          // if (e.code == 'user-not-found') {
                          //   print('No user found, please enter valid username');
                          //   message =
                          //       "No user found, please enter valid username";
                          // } else if (e.code == 'wrong-password') {
                          //   print("Wrong password provided!");
                          //   message = "Wrong password provided!";
                          // }
                          setState(() {
                            if (e.code == 'user-not-found') {
                              message =
                                  "User not found! Please enter valid username";
                            } else if (e.code == 'wrong-password') {
                              message =
                                  "Wrong password! Please enter correct password";
                            }
                            // message = "Invalid username or password";
                          });
                          // print("Error ${error.toString()}");
                        }
                        
                      }
                    }),
                  ),
                  
                  // const CircularProgressIndicator(),

                  signUpOption(),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    message,
                    style: TextStyle(
                        color: Colors.red[800], fontWeight: FontWeight.bold),
                  ),
                ],
              )),
        )),
      ),
    );
  }

  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Dont have an account?",
          style: TextStyle(color: Colors.white70, fontSize: 15),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => signUp()));
          },
          child: const Text(
            " Sign Up",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
          ),
        )
      ],
    );
  }
}
