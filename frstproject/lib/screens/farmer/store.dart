import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../storeHome.dart';

class FarmStore extends StatefulWidget {
  final String userid;
  const FarmStore({Key? key, required this.userid}) : super(key: key);
  @override
  State<FarmStore> createState() => _FarmStoreState();
}

Future<DocumentSnapshot<Map<String, dynamic>>> getUserData(
    String userId) async {
  return FirebaseFirestore.instance.collection('users').doc(userId).get();
}

class _FarmStoreState extends State<FarmStore> {
  Map<String, dynamic> userData = {};
  int _selectedIndex = 0;
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

  static const List<Widget> _widgetOptions = <Widget>[
    Text('Home'),
    Text('Search'),
    Text('basket'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[800],
        title: Text('FarmNow Store'),
        toolbarHeight: 75,
      ),
      body: Column(children: [
        Padding(
          padding:
              const EdgeInsets.only(left: 30.0, right: 30, bottom: 10, top: 10),
          child: Image.asset(
            "assets/images/farmnow.png",
            width: 280,
            height: 280,
          ),
        ),
        Padding(
            padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10),
            child: Text("We deliver\n directly from the farmer",
                textAlign: TextAlign.center,
                style: GoogleFonts.notoSerif(
                    fontSize: 48, fontWeight: FontWeight.bold))),
        const SizedBox(height: 24),
        const Text(
          "items that you need",
          style: TextStyle(color: Colors.grey),
        ),
        const Spacer(),
        GestureDetector(
          onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (context) {
              return const StoreHome();
            },
          )),
          child: Container(
            decoration: BoxDecoration(
                color: (Colors.lightGreen),
                borderRadius: BorderRadius.circular(12)),
            padding: const EdgeInsets.all(14),
            child: const Text("Get Started",
                style: TextStyle(color: Colors.white)),
          ),
        )
      ]),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Basket',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
