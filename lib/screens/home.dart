import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../seach_bar.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      body: Center (
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Image(image: AssetImage('assets/images/logo.png'),)
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: SearchBar(),
            ),
          ]
        ),
      ),
      backgroundColor: Colors.grey[850],
    );
  }
}