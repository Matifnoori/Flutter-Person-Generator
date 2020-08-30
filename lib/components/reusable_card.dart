import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {

  ReusableCard({this.title, this.icon});

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin:
      EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
      child: ListTile(
        leading: Icon(
          icon,
          color: Colors.teal,
        ),
        title: Text(
          title,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.teal
          ),
        ),
      ),
    );
  }
}