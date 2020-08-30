import 'package:flutter/material.dart';
import 'package:persone_generator/components/reusable_card.dart';
import 'package:persone_generator/models/person_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Male extends StatefulWidget {
  @override
  _MaleState createState() => _MaleState();
}

class _MaleState extends State<Male> {
  Future<PersonModel> person;

  String url = 'https://randomuser.me/api/?gender=male';

  @override
  void initState() {
    super.initState();
    person = getPerson();
  }

  Future<PersonModel> getPerson() async {
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return PersonModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Please Check Internet Connection');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
          FutureBuilder<PersonModel>(
            future: person,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView(
                  children: <Widget>[
                    SizedBox(
                      height: 20.0,
                    ),
                    Center(
                      child: CircleAvatar(
                        backgroundColor: Color(0xFFE91E63),
                        radius: 75.0,
                        child: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          radius: 70.0,
                          backgroundImage: NetworkImage(snapshot.data.imageUrl),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    ReusableCard(
                      title: snapshot.data.first + ' ' + snapshot.data.last,
                      icon: Icons.person,
                    ),
                    ReusableCard(
                      title: snapshot.data.dob.substring(0, 10),
                      icon: Icons.calendar_today,
                    ),
                    ReusableCard(
                      title: snapshot.data.phone,
                      icon: Icons.phone,
                    ),
                    ReusableCard(
                      title: snapshot.data.email,
                      icon: Icons.email,
                    ),
                    ReusableCard(
                      title: snapshot.data.streetNumber +
                          ' ' +
                          snapshot.data.streetName,
                      icon: Icons.my_location,
                    ),
                    ReusableCard(
                      title: snapshot.data.city,
                      icon: Icons.location_city,
                    ),
                    ReusableCard(
                      title: snapshot.data.nationality,
                      icon: Icons.flag,
                    ),
                  ],
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text(
                    "${snapshot.error}",
                    style: Theme.of(context).textTheme.headline1.apply(
                          color: Colors.white,
                          fontSizeFactor: 0.2,
                          fontWeightDelta: 5,
                        ),
                  ),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
