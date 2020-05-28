import 'package:flutter/material.dart';

class orgHomePage extends StatefulWidget {
  @override
  _orgHomePageState createState() => _orgHomePageState();
}

class _orgHomePageState extends State<orgHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: FlatButton(
              child: Text('Return'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
