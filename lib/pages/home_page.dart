import 'package:flutter/material.dart';
import 'package:Ever/services/authentication.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:Ever/models/todo.dart';
import 'package:Ever/template/colors.dart';
import 'package:Ever/template/eventCard.dart';
import 'dart:async';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.auth, this.userId, this.logoutCallback})
      : super(key: key);

  final BaseAuth auth;
  final VoidCallback logoutCallback;
  final String userId;

  @override
  State<StatefulWidget> createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Todo> _todoList;

  final FirebaseDatabase _database = FirebaseDatabase.instance;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final _textEditingController = TextEditingController();
  StreamSubscription<Event> _onTodoAddedSubscription;
  StreamSubscription<Event> _onTodoChangedSubscription;

  Query _todoQuery;

  signOut() async {
    try {
      await widget.auth.signOut();
      widget.logoutCallback();
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: PreferredSize(
      //   preferredSize: Size.fromHeight(70),
      //   child: AppBar(
      //     backgroundColor: darkBackgroundColor,
      //     title: new Text(
      //       'EVER',
      //       style: TextStyle(
      //           fontFamily: 'Montserrat',
      //           color: white,
      //           fontSize: 40,
      //           fontWeight: FontWeight.bold),
      //     ),
      //     actions: <Widget>[
      //       new FlatButton(
      //           child: new Text('Logout',
      //               style: new TextStyle(fontSize: 17.0, color: Colors.white)),
      //           onPressed: signOut),
      //     ],
      //   ),
      // ),
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: 120.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0)),
                  color: darkBackgroundColor,
                ),
              ),
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30.0, vertical: 10.0),
                  child: Text(
                    'EVER',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Positioned(
                right: 30.0,
                bottom: 28.0,
                child: InkWell(
                  child: Text(
                    'Log Out',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 18.0,
                        color: Colors.white),
                  ),
                  onTap: () {
                    signOut();
                  },
                ),
              ),
            ],
          ),
          Expanded(
            child: home(),
          ),
        ],
      ),
    );
  }
}

class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: <Widget>[
                  FlatButton(
                      child: eventCard(
                          eventName: 'Event Name', category: 1)),
                  FlatButton(
                      child: eventCard(
                          eventName: 'Event Name', category: 0)),
                  FlatButton(
                      child: eventCard(
                          eventName: 'Event Name', category: 1)),
                  FlatButton(
                      child: eventCard(
                          eventName: 'Event Name', category: 0)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
