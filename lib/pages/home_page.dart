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
    return new Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBar(
          backgroundColor: darkBackgroundColor,
          title: new Text('EVER', style: TextStyle(fontFamily: 'Montserrat', color: white, fontSize: 40, fontWeight: FontWeight.bold),),
          actions: <Widget>[
            new FlatButton(
              child: new Text('Logout',
              style: new TextStyle(fontSize: 17.0, color: Colors.white)),
              onPressed: signOut),
        ],
      ),
      ),
      body: home(),
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
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0,20,0,0),
          child: Center(
            child: Column(
              children: <Widget>[
                FlatButton(child: eventCard(eventName: 'Event Name', category: 'non-profit')),
                FlatButton(child: eventCard(eventName: 'Event Name', category: 'non-profit')),
                FlatButton(child: eventCard(eventName: 'Event Name', category: 'non-profit')),
                FlatButton(child: eventCard(eventName: 'Event Name', category: 'non-profit')),
              ],
            ),
          ),
        ),

      )

    );
  }
}
