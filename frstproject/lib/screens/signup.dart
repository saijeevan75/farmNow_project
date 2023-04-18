import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frstproject/reusable_widgets/reusable.dart';
import 'package:frstproject/screens/signin.dart';

import '../roles.dart';
import '../utils/colors_util.dart';
import 'farmer_home.dart';

var currentSelected = "Farmer";
var role = "Farmer";

var items = ["Farmer", "Individual", "Organization"];

final _auth = FirebaseAuth.instance;

class signUp extends StatefulWidget {
  const signUp({super.key});

  @override
  State<signUp> createState() => _signUpState();
}

class _signUpState extends State<signUp> {
  final TextEditingController _usernameTextController = TextEditingController();
  final TextEditingController _rePasswordTextController =
      TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _phoneNumberTextController =
      TextEditingController();

  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Sign Up",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
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
                  10, MediaQuery.of(context).size.height * 0.05, 20, 0),
              child: Column(children: <Widget>[
                logoWidget("assets/images/farmnow.png"),

                titlee(),
                const SizedBox(
                  height: 20,
                ),
                //const Spacer(),

                reusableTextFieldName("Enter Name", Icons.person_2_outlined,
                    false, _usernameTextController),
                const SizedBox(
                  height: 20,
                ),

                reusableTextFieldEmail("Enter e-mail", Icons.person_2_outlined,
                    false, _emailTextController),
                const SizedBox(
                  height: 20,
                ),

                reusableTextFieldPassword("Enter Password", Icons.lock_outline,
                    true, _passwordTextController),

                const SizedBox(
                  height: 20,
                ),

                reusableTextFieldRePassword(
                    "Re-Enter Password",
                    Icons.lock_outline,
                    true,
                    _passwordTextController,
                    _rePasswordTextController),

                const SizedBox(
                  height: 20,
                ),

                reusableTextFieldPhNo(
                    "Enter Mobile Number",
                    Icons.mobile_friendly_rounded,
                    true,
                    _phoneNumberTextController),

                const SizedBox(
                  height: 20,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Select User Type  ",
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                    DropdownButton<String>(
                      dropdownColor: hexStringToColor("#17B169"),
                      isDense: false,
                      isExpanded: false,
                      iconEnabledColor: Colors.white,
                      focusColor: Colors.black,
                      items: items.map((String dropDownStringItem) {
                        return DropdownMenuItem<String>(
                          value: dropDownStringItem,
                          child: Text(
                            dropDownStringItem,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (newValueSelected) {
                        setState(() {
                          currentSelected = newValueSelected!;
                          role = newValueSelected;
                        });
                      },
                      value: currentSelected,
                    ),
                  ],
                ),

                const SizedBox(
                  height: 20,
                ),
                pageButton(context, false, () {
                  signUp(
                      _emailTextController.text,
                      _passwordTextController.text,
                      role,
                      _usernameTextController.text,
                      _phoneNumberTextController.text);
                })
              ]),
            ),
          ),
        ),
      ),
    );
  }

  Row titlee() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Text(
          'REGISTRATION',
          style: TextStyle(
              color: Colors.white, fontSize: 19, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  void signUp(String email, String password, String role, String name,
      String phNo) async {
    const CircularProgressIndicator();
    await _auth
        .createUserWithEmailAndPassword(
            email: _emailTextController.text,
            password: _passwordTextController.text)
        .then((value) => {postDetailsToFirestore(email, role, name, phNo)})
        // ignore: body_might_complete_normally_catch_error
        .catchError((e) {});
  }

  postDetailsToFirestore(
      String email, String role, String name, String phNo) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;
    UserRole userRole = UserRole();
    userRole.uid = user!.uid;
    userRole.email = email;
    userRole.role = role;
    userRole.name = name;
    userRole.phNo = phNo;
    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userRole.toMap());

    // ignore: use_build_context_synchronously
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => const SignScreen(
                  title: "Login",
                )));
  }
}
