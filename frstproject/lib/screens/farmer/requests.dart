import 'package:flutter/material.dart';

class SlotRequests extends StatefulWidget {
  const SlotRequests({super.key});

  @override
  State<SlotRequests> createState() => _SlotRequestsState();
}

class _SlotRequestsState extends State<SlotRequests> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[800],
        title: Text('Slot Requests'),
        toolbarHeight: 70,
      ),
    );
  }
}