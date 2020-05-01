import 'dart:convert';

import 'package:Ever/models/Events.dart';
import 'package:flutter/material.dart';
import 'package:Ever/services/authentication.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:Ever/models/todo.dart';
import 'package:Ever/template/colors.dart';
import 'package:Ever/template/eventCard.dart';
import 'package:Ever/template/eventModalBottomSheet.dart';
import 'dart:async';
import 'package:http/http.dart' as http;

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
                            InkWell(
                              child: Text(
                                'EVER',
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: white,
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold),
                              ),
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
  List<Events> _events = List<Events>();

  Future<List<Events>> fetchEvents() async {
    var url =
        'https://raw.githubusercontent.com/KevinYobeth/kevinyobeth.github.io/master/Ever/event.json';
    var response = await http.get(url);

    var events = List<Events>();

    if (response.statusCode == 200) {
      var eventsJson = json.decode(response.body);
      for (var eventJson in eventsJson['event']) {
        events.add(Events.fromJson(eventJson));
      }
    }
    return events;
  }

  @override
  void didUpdateWidget(home oldWidget) {
    if (_events.isEmpty || _events.isNotEmpty) {
      fetchEvents().then((value) {
        print('Fetching Data');
        setState(() {
          _events.addAll(value);
        });
      });
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    @override
    void initState() {
      fetchEvents().then((value) {
        print('Fetching Data');
        setState(() {
          _events.addAll(value);
        });
      });
      super.initState();
    }

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
                        eventName: _events[0].eventName,
                        isNonProfit: _events[0].isNonProfit,
                        eventThumb: _events[0].eventThumb),
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
                        eventName: _events[1].eventName,
                        isNonProfit: _events[1].isNonProfit,
                        eventThumb: _events[1].eventThumb),
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
                        eventName: _events[2].eventName,
                        isNonProfit: _events[2].isNonProfit,
                        eventThumb: _events[2].eventThumb),
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
                      eventName: _events[3].eventName,
                      isNonProfit: _events[3].isNonProfit,
                      eventThumb: _events[3].eventThumb),
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
