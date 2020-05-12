import 'package:Ever/models/acara.dart';
import 'package:flutter/material.dart';
import 'package:Ever/services/authentication.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:Ever/template/colors.dart';
import 'package:Ever/template/eventCard.dart';
import 'package:Ever/template/eventDetailBottomSheet.dart';
import 'package:Ever/template/profileBottomSheet.dart';
import 'dart:async';

bool _eventCardIsUp = false;
final appKey = new GlobalKey<FormState>();

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
  signOut() async {
    try {
      await widget.auth.signOut();
      widget.logoutCallback();
    } catch (e) {
      print(e);
    }
  }

  Color color;

  @override
  void initState() {
    color = _eventCardIsUp ? darkBackgroundColor : Colors.white;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Stack(
            key: appKey,
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
                                    color: color,
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            InkWell(
                              child: Icon(
                                Icons.power_settings_new,
                                color: color,
                                size: 40,
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
                  color: _eventCardIsUp ? Colors.white : darkBackgroundColor,
                ),
              ),
            ],
          ),
          Expanded(child: home()),
        ],
      ),
    );
  }
}

final FirebaseDatabase db = FirebaseDatabase.instance;

class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  List<Acara> _acaraList;
  Query _acaraQuery;

  StreamSubscription<Event> _onAcaraAddedSubscription;

  @override
  void initState() {
    _eventCardIsUp = false;
    _acaraList = new List();
    _acaraQuery = db.reference().child("event").orderByChild("eventID");
    _onAcaraAddedSubscription = _acaraQuery.onChildAdded.listen(onEntryAdded);
    super.initState();
  }

  onEntryAdded(Event acara) {
    setState(() {
      _acaraList.add(Acara.fromSnapshot(acara.snapshot));
    });
  }

  _addEvent(String userID) {
    List divisi = ['Division'];
    Acara newAcara = new Acara(
        eventBenefits: 'Benefits',
        eventCriteria: 'Criteria',
        eventDate: 'Tomorrow',
        eventDesc: 'Description',
        eventDivision: divisi,
        eventID: 4,
        eventName: 'Event Name',
        eventOrganizer: userID,
        eventPlace: 'Dirumah',
        eventThumb:
            'https://firebasestorage.googleapis.com/v0/b/ever-a01f1.appspot.com/o/Banner_ComputerRun.jpg?alt=media&token=0be947f4-37da-4ce8-953d-a9cf752e6a15',
        eventTime: 'Ntaran lagi',
        isNonProfit: false);
    db.reference().child("event").push().set(newAcara.toJson());
  }

  _removeEvent() {
    db
        .reference()
        .child("event")
        .child("-M7835sMtlK9dza42ypT")
        .remove()
        .then((_) {
      setState(() {
        _acaraList.removeAt(4);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget _showAcaraList() {
      if (_acaraList.length > 0) {
        return ListView.builder(
          physics: BouncingScrollPhysics(),
          shrinkWrap: false,
          itemCount: _acaraList.length,
          itemBuilder: (BuildContext context, int index) {
            int eventID = _acaraList[index].eventID;
            String eventName = _acaraList[index].eventName;
            String eventOrganizer = _acaraList[index].eventOrganizer;
            String eventThumb = _acaraList[index].eventThumb;
            String eventTime = _acaraList[index].eventTime;
            String eventDate = _acaraList[index].eventDate;
            String eventPlace = _acaraList[index].eventPlace;
            String eventDesc = _acaraList[index].eventDesc;
            String eventCriteria = _acaraList[index].eventCriteria;
            List eventDivision = _acaraList[index].eventDivision;
            String eventBenefits = _acaraList[index].eventBenefits;
            bool isNonProfit = _acaraList[index].isNonProfit;
            return FlatButton(
              child: eventCard(
                eventName: eventName,
                isNonProfit: isNonProfit,
                eventThumb: eventThumb,
              ),
              onPressed: () {
                setState(() {
                  _eventCardIsUp = !_eventCardIsUp;
                  print(_eventCardIsUp);
                });
                eventDetailBottomSheet(
                  context,
                  eventName: eventName,
                  eventOrganizer: eventOrganizer,
                  isNonProfit: isNonProfit,
                  eventThumb: eventThumb,
                  eventDate: eventDate,
                  eventTime: eventTime,
                  eventPlace: eventPlace,
                  eventDesc: eventDesc,
                  criteria: eventCriteria,
                  division: eventDivision,
                  benefits: eventBenefits,
                );
              },
            );
          },
        );
      } else {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(child: Text('Loading Data')),
        );
      }
    }

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: white,
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: _showAcaraList(),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.person),
        backgroundColor: darkBackgroundColor,
        onPressed: () {
          //_addEvent('2201729713');
          //_removeEvent();
          profileBottomSheet(context);
        },
      ),
    );
  }
}
