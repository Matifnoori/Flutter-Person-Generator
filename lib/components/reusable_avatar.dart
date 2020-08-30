import 'package:flutter/material.dart';


class ReusableAvatar extends StatelessWidget {

  ReusableAvatar({this.imagePath, this.onPress});

  final String imagePath;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: CircleAvatar(
        radius: 80.0,
        backgroundColor: Colors.transparent,
        backgroundImage: AssetImage(imagePath),
      ),
    );
  }
}