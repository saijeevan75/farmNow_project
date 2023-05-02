import 'package:flutter/material.dart';
import 'package:frstproject/screens/individual/profile.dart';

import 'package:frstproject/screens/individual/activity.dart';

import 'homepage.dart';

class HomePage extends StatefulWidget {
  final String userid;
  const HomePage({Key? key, required this.userid}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> _screens = [
      IndividualUI(
        userid: widget.userid,
      ),
      const UserActivity(),
      const UserProfile(),
    ];
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: _screens[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          currentIndex: currentIndex,
          selectedItemColor: Colors.green[800],
          selectedLabelStyle:
              const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
          unselectedLabelStyle:
              const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
          unselectedItemColor: Colors.grey,
          onTap: (int index) {
            setState(() {
              currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: 'My Activity',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'My Profile',
            ),
          ],
        ),
      ),
    );
  }
}
