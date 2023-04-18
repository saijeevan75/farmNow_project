import 'package:flutter/material.dart';

class FarmStore extends StatefulWidget {
  const FarmStore({super.key});

  @override
  State<FarmStore> createState() => _FarmStoreState();
}

class _FarmStoreState extends State<FarmStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[800],
        title: Text('FarmNow Store'),
        toolbarHeight: 70,
      ),
    );
  }
}
