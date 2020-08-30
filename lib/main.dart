import 'package:flutter/material.dart';
import 'package:persone_generator/screens/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Person Generator',
      color: Colors.pink,
      home: HomeScreen(),
    );
  }
}