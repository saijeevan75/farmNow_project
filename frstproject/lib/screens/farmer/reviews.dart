import 'package:flutter/material.dart';

class ViewReviews extends StatefulWidget {
  const ViewReviews({super.key});

  @override
  State<ViewReviews> createState() => _ViewReviewsState();
}

class _ViewReviewsState extends State<ViewReviews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[800],
        title: Text('User Reviews'),
        toolbarHeight: 70,
      ),
    );
  }
}
