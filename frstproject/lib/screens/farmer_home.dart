import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:frstproject/screens/signin.dart';

import '../reusable_widgets/reusable.dart';
import 'farmer/crop.dart';
import 'farmer/details.dart';
import 'farmer/farmDetails.dart';
import 'farmer/inventory.dart';
import 'farmer/irrigation.dart';
import 'farmer/requests.dart';
import 'farmer/reviews.dart';
import 'farmer/store.dart';

class HomeScreen extends StatefulWidget {
  final String userid;
  const HomeScreen({Key? key, required this.userid}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

Future<DocumentSnapshot<Map<String, dynamic>>> getUserData(
    String userId) async {
  return FirebaseFirestore.instance.collection('users').doc(userId).get();
}

class _HomeScreenState extends State<HomeScreen> {
  Map<String, dynamic> userData = {};

  @override
  void initState() {
    super.initState();
    _getUserData();
  }

  Future<void> _getUserData() async {
    DocumentSnapshot<Map<String, dynamic>> snapshot =
        await getUserData(widget.userid);
    setState(() {
      userData = snapshot.data()!;
    });
  }

  List options = [
    'Farm Details ',
    //'Inventory',
    //'Irrigation',
    'View Reviews',
    'Store',
    'Slot Requests'
  ];
  List<Color?> optinColors = [
    Colors.green[700],
    Colors.green[700],
    Colors.green[700],
    Colors.green[700],

    // Colors.green,
    // Colors.green,
  ];
  List<Icon> optionIcons = [
    const Icon(Icons.text_snippet, color: Colors.white, size: 45),
    const Icon(Icons.menu_book, color: Colors.white, size: 45),
    const Icon(Icons.local_grocery_store, color: Colors.white, size: 45),
    const Icon(Icons.group_add, color: Colors.white, size: 45),
    //const Icon(Icons.cabin, color: Colors.white, size:25),
    //const Icon(Icons.cabin, color: Colors.white, size:25),
  ];
  List help = ['Inventory', 'Irrigation', 'Crop'];

  List<Color?> helpColors = [
    Colors.green[700],
    Colors.green[700],
    Colors.green[700],
  ];

  List helpIcons = [
    const Icon(Icons.inventory, color: Colors.white, size: 25),
    const Icon(Icons.cabin, color: Colors.white, size: 25),
    const Icon(Icons.grass, color: Colors.white, size: 25),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: _scaffoldKey,
      appBar: AppBar(
        toolbarHeight: 75,
        backgroundColor: Colors.green[800],
        title: Text('Hello ${userData!['name']}!'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.green[800],
              ),
              child: Container(
                height: 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'FarmNow',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                    logoWidgetDrawer("assets/images/farmnow.png", 106, 106),
                  ],
                ),
              ),
            ),
            ListTile(
              title: Text('Profile'),
              onTap: () {
                // Handle profile tap
                Navigator.pop(context); // Close the drawer
                // Add logic to navigate to profile page
              },
            ),
            ListTile(
              title: Text('Logout'),
              onTap: () {
                // Handle logout tap
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SignScreen(
                            title: '',
                          )), // Replace AnotherPage() with the desired destination page
                ); // Close the drawer
                // Add logic to handle logout
              },
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          // Container(
          //   padding:
          //       const EdgeInsets.only(top: 10, left: 15, right: 20, bottom: 10),
          //   decoration: BoxDecoration(color: Colors.green[700]),
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         children: [
          //           const Icon(
          //             Icons.menu,
          //             size: 30,
          //             color: Colors.white,
          //           ),
          //           Container(
          //             child: GestureDetector(
          //               child: const Icon(
          //                 Icons.notifications_rounded,
          //                 size: 30,
          //                 color: Colors.white,
          //               ),
          //               onTap: () {
          //                 Navigator.push(
          //                     context,
          //                     MaterialPageRoute(
          //                         builder: (context) =>
          //                             FarmerDetails(userid: widget.userid)));
          //               },
          //             ),
          //           ),
          //         ],
          //       ),
          //       const SizedBox(height: 15),
          //       Container(
          //         padding: const EdgeInsets.only(left: 5, bottom: 15),
          //         child: Text(
          //           "Hello  ${userData!['name']}!",
          //           style: const TextStyle(
          //               fontSize: 21,
          //               fontWeight: FontWeight.bold,
          //               color: Colors.white),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.only(top: 55, left: 15, right: 20),
            child: Column(
              children: [
                Container(
                  height: 55,
                  width: 300,
                  padding: const EdgeInsets.only(left: 90),
                  //color: Colors.green,
                  child: Text(
                    'Access Here:',
                    style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 15),
                GridView.builder(
                  itemCount: optionIcons.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.4,
                    mainAxisSpacing: 2,
                  ),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        if (index == 0) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  FarmDetails(userid: widget.userid),
                            ),
                          );
                        } else if (index == 1) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ViewReviews(),
                            ),
                          );
                        } else if (index == 2) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FarmStore(userid:widget.userid),
                            ),
                          );
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SlotRequests(),
                            ),
                          );
                        }
                      },
                      child: Column(
                        children: [
                          Container(
                            height: 80,
                            width: 130,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: optinColors[index],
                              shape: BoxShape.rectangle,
                            ),
                            child: Center(child: optionIcons[index]),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            options[index],
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "FarmNow experts are ready to help you!",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: Colors.grey[700]),
                    )
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                GridView.builder(
                  itemCount: help.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1.4,
                    mainAxisSpacing: 2,
                  ),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        if (index == 0) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => InventoryPage(),
                            ),
                          );
                        } else if (index == 1) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => IrrigationPage(),
                            ),
                          );
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CropPage(),
                            ),
                          );
                        }
                      },
                      child: Column(
                        children: [
                          Container(
                            height: 55,
                            width: 55,
                            decoration: BoxDecoration(
                              color: helpColors[index],
                              shape: BoxShape.circle,
                            ),
                            child: Center(child: helpIcons[index]),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            help[index],
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.green[700],
        unselectedItemColor: Colors.grey[500],
        iconSize: 27,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: Center(
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: [
  //           if (userData == null) CircularProgressIndicator(),
  //           if (userData != null)
  //             Column(
  //               children: [
  //                 Text("Welcome ${userData!['name']}!"),
  //                 ElevatedButton(
  //                   child: Text("Logout ${userData!['name']}!"),
  //                   onPressed: () {
  //                     FirebaseAuth.instance.signOut().then((value) {
  //                       print("Signed out");
  //                       Navigator.push(
  //                         context,
  //                         MaterialPageRoute(
  //                           builder: (context) => SignScreen(
  //                             title: 'Sign in',
  //                           ),
  //                         ),
  //                       );
  //                     });
  //                   },
  //                 ),
  //               ],
  //             ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
