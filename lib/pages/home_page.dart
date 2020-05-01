import 'package:flutter/material.dart';
import 'package:Ever/services/authentication.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:Ever/models/todo.dart';
import 'package:Ever/template/colors.dart';
import 'package:Ever/template/eventCard.dart';
import 'package:Ever/template/eventModalBottomSheet.dart';
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
                child: SafeArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'EVER',
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  color: white,
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold),
                            ),
                            InkWell(
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
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0)),
                  color: darkBackgroundColor,
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
                        eventName: 'Synchronity',
                        isNonProfit: true,
                        eventThumb:
                            'https://raw.githubusercontent.com/KevinYobeth/kevinyobeth.github.io/master/Ever/Banner/Banner_Synchronity.jpg'),
                    onPressed: () {
                      eventModalBottomSheet(context,
                          eventName: 'Synchronity',
                          isNonProfit: true,
                          eventThumb: 'https://raw.githubusercontent.com/KevinYobeth/kevinyobeth.github.io/master/Ever/Banner/Banner_Synchronity.jpg',
                          eventDate: 'Rabu, 18 Maret 2020',
                          eventPlace: 'Indonesia Convention Exhibition Center BSD',
                          eventDesc: 'This is the event description',
                          criteria: 'This is our volunteer criteria',
                          division: 'We need some division',
                          benefits: 'If you join us, you will get this'
                      );
                    },
                  ),
                  FlatButton(
                    child: eventCard(
                        eventName: 'Rearthlity',
                        isNonProfit: false,
                        eventThumb:
                            'https://raw.githubusercontent.com/KevinYobeth/kevinyobeth.github.io/master/Ever/Banner/Banner_Rearthlity.jpg'),
                    onPressed: () {
                      eventModalBottomSheet(context,
                          eventName: 'Rearthlity',
                          isNonProfit: false,
                          eventThumb: 'https://raw.githubusercontent.com/KevinYobeth/kevinyobeth.github.io/master/Ever/Banner/Banner_Rearthlity.jpg',
                          eventDate: 'Rabu, 18 Maret 2020',
                          eventPlace: 'Indonesia Convention Exhibition Center BSD',
                          eventDesc: 'This is the event description',
                          criteria: 'This is our volunteer criteria',
                          division: 'We need some division',
                          benefits: 'If you join us, you will get this'
                      );
                    },
                  ),
                  FlatButton(
                    child: eventCard(
                        eventName: 'Computer Run',
                        isNonProfit: false,
                        eventThumb:
                            'https://raw.githubusercontent.com/KevinYobeth/kevinyobeth.github.io/master/Ever/Banner/Banner_ComputerRun.jpg'),
                    onPressed: () {
                      eventModalBottomSheet(context,
                          eventName: 'Computer Run',
                          isNonProfit: false,
                          eventThumb: 'https://raw.githubusercontent.com/KevinYobeth/kevinyobeth.github.io/master/Ever/Banner/Banner_ComputerRun.jpg',
                          eventDate: 'Rabu, 18 Maret 2020',
                          eventPlace: 'Indonesia Convention Exhibition Center BSD',
                          eventDesc: 'This is the event description',
                          criteria: 'This is our volunteer criteria',
                          division: 'We need some division',
                          benefits: 'If you join us, you will get this'
                      );
                    },
                  ),
                  FlatButton(
                    child: eventCard(
                      eventName: 'HISHOT',
                      isNonProfit: false,
                      eventThumb:
                          'https://raw.githubusercontent.com/KevinYobeth/kevinyobeth.github.io/master/Ever/Banner/Banner_Hishot.jpg',
                    ),
                    onPressed: () {
                      eventModalBottomSheet(context,
                          eventName: 'HISHOT',
                          isNonProfit: false,
                          eventThumb: 'https://raw.githubusercontent.com/KevinYobeth/kevinyobeth.github.io/master/Ever/Banner/Banner_Hishot.jpg',
                          eventDate: 'Rabu, 18 Maret 2020',
                          eventPlace: 'Indonesia Convention Exhibition Center BSD',
                          eventDesc: 'This is the event description',
                          criteria: 'This is our volunteer criteria',
                          division: 'We need some division',
                          benefits: 'If you join us, you will get this'
                      );
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
