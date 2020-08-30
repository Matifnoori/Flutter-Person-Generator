import 'package:flutter/material.dart';
import 'package:persone_generator/components/reusable_avatar.dart';
import 'package:persone_generator/screens/female.dart';

import 'male.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color(0xFFFF004E),
                Color(0xFF82073D),
              ],
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Person',
              style: Theme.of(context).textTheme.headline1.apply(
                    color: Colors.white,
                    fontSizeFactor: 0.5,
                    fontWeightDelta: 5,
                  ),
            ),
            Text(
              'Generator',
              style: Theme.of(context).textTheme.headline1.apply(
                    color: Colors.white,
                    fontSizeFactor: 0.5,
                    fontWeightDelta: 2,
                  ),
            ),
            SizedBox(
              height: 100.0,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ReusableAvatar(
                  imagePath: 'assets/male.png',
                  onPress: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Male(),
                      ),
                    );
                  },
                ),
                ReusableAvatar(
                  imagePath: 'assets/female.png',
                  onPress: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Female(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}