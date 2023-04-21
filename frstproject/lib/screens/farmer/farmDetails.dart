import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:frstproject/screens/farmer_home.dart';
import 'package:image_picker/image_picker.dart';
import '../../reusable_widgets/reusable.dart';
import '../../roles.dart';



final _auth = FirebaseAuth.instance;

class FarmDetails extends StatefulWidget {
  final String userid;
  const FarmDetails({Key? key, required this.userid}) : super(key: key);

  @override
  State<FarmDetails> createState() => _FarmDetailsState();
}

class _FarmDetailsState extends State<FarmDetails> {
  final TextEditingController _cityTextController = TextEditingController();
  final TextEditingController _addressTextController = TextEditingController();
  final TextEditingController _cropTextController = TextEditingController();
  final TextEditingController _priceTextController = TextEditingController();

  final ImagePicker picker = ImagePicker();
  XFile? image;
  Future getImage(ImageSource media) async {
    var img = await picker.pickImage(source: media);

    setState(() {
      image = img;
    });
  }

  final _formkey = GlobalKey<FormState>();

  void myAlert() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            title: Text('Please choose media to select'),
            content: Container(
              decoration: BoxDecoration(),
              height: MediaQuery.of(context).size.height / 6,
              child: Column(
                children: [
                  ElevatedButton(
                    //if user click this button, user can upload image from gallery
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.gallery);
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.green),
                    ),

                    child: Row(
                      children: [
                        Icon(Icons.image),
                        Text('From Gallery'),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    //if user click this button. user can upload image from camera
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.camera);
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.green),
                    ),
                    child: Row(
                      children: const [
                        Icon(Icons.camera),
                        Text('From Camera'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[800],
        title: Text('Farm Details'),
        toolbarHeight: 70,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(),
        /*gradient: LinearGradient(colors: [
          hexStringToColor("#50C878"),
          hexStringToColor("#50C878"),
          hexStringToColor("#1CAC78"),
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),*/
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Padding(
              //EdgeInsets.fromLTRB(left, top, right, bottom)
              padding: EdgeInsets.fromLTRB(15, 0, 20, 0),
              child: Column(children: <Widget>[
                logofarmdetails("assets/images/farmnow.png", 200, 200),
                const SizedBox(
                  height: 0,
                ),
                Text(
                  'Please fill the required farm details:',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.grey[600]),
                ),

                const SizedBox(
                  height: 20,
                ),
                //const Spacer(),

                reusableTextFieldNameFF("Enter City", Icons.person_2_outlined,
                    false, _cityTextController),
                const SizedBox(
                  height: 20,
                ),

                reusableTextFieldNameFF("Enter address",
                    Icons.person_2_outlined, false, _addressTextController),
                const SizedBox(
                  height: 20,
                ),

                reusableTextFieldNameFF("Enter Crop", Icons.lock_outline, true,
                    _cropTextController),

                const SizedBox(
                  height: 20,
                ),

                reusableTextFieldPhNoFF("Enter Price Per day",
                    Icons.mobile_friendly_rounded, true, _priceTextController),

                const SizedBox(
                  height: 20,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 25),
                      child: ElevatedButton(
                          onPressed: () {
                            myAlert();
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color?>(
                                Colors.green[800]),
                          ),
                          child: const Text('Upload Photo')),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),

                const SizedBox(
                  height: 20,
                ),
                /*image != null
                    ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.file(
                            //to show image, you type like this.
                            File(image!.path),
                            fit: BoxFit.cover,
                            width: MediaQuery.of(context).size.width,
                            height: 300,
                          ),
                        ),
                      )
                    : const Text(
                        "",
                        style: TextStyle(fontSize: 20),
                      ),*/
                ElevatedButton(
                  onPressed: () async {
                    if (_formkey.currentState!.validate()) {
                      final bytes = await image!.readAsBytes();
                      final base64Image = base64Encode(bytes);
                      fill(
                          _cityTextController.text,
                          _addressTextController.text,
                          _cropTextController.text,
                          _priceTextController.text,
                          base64Image,
                          widget.userid);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                HomeScreen(userid: '',)), // Replace AnotherPage() with the desired destination page
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(140, 50),
                    primary: Colors.green[800],
                  ),
                  child: const Text('Submit form',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }

  void fill(String city, String address, String crop, String price, String img,
      String userid) async {
    // FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    // User? user = _auth.currentUser;
    Farmdetails farmdetails = Farmdetails();
    farmdetails.city = city;
    farmdetails.address = address;
    farmdetails.crop = crop;
    farmdetails.price = price;
    farmdetails.img = img;
    final userDocRef =
        FirebaseFirestore.instance.collection('users').doc(userid);
    final newCollectionRef = userDocRef.collection('farmDetails');
    await newCollectionRef.add({
      'city': city,
      'address': address,
      'crop': crop,
      'price': price,
      'img': img
    });

    // await firebaseFirestore
    //     .collection("farmdetails")
    //     .doc(userid)
    //     .set(Farmdetails.toMap());

    // ignore: use_build_context_synchronously
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HomeScreen(
          userid: userid,
        ),
      ),
    );
  }
}
