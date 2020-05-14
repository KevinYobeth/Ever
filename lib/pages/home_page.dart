import 'package:Ever/models/acara.dart';
import 'package:Ever/models/organizer.dart';
import 'package:Ever/models/user.dart';
import 'package:flutter/material.dart';
import 'package:Ever/services/authentication.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:Ever/template/colors.dart';
import 'package:Ever/template/eventCard.dart';
import 'package:Ever/template/eventDetailBottomSheet.dart';
import 'package:Ever/template/profileBottomSheet.dart';
import 'dart:async';

bool _eventCardIsUp = false;
String userID;

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

  refresh() {
    setState(() {
      _eventCardIsUp = !_eventCardIsUp;
    });
  }

  @override
  void initState() {
    userID = widget.userId;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackgroundColor,
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
                                    color: _eventCardIsUp
                                        ? Colors.black
                                        : Colors.white,
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            InkWell(
                              child: Icon(
                                Icons.power_settings_new,
                                color: _eventCardIsUp
                                    ? Colors.black
                                    : Colors.white,
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
                  color: _eventCardIsUp
                      ? lightBackgroundColor
                      : darkBackgroundColor,
                ),
              ),
            ],
          ),
          Expanded(
              child: home(
            notifyParent: refresh,
          )),
        ],
      ),
    );
  }
}

final FirebaseDatabase db = FirebaseDatabase.instance;

class home extends StatefulWidget {
  final Function() notifyParent;
  home({Key key, @required this.notifyParent}) : super(key: key);
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  List<Acara> _acaraList;
  List<User> _userList;
  List<Organizer> _organizerList;

  Query _acaraQuery;
  Query _userQuery;
  Query _organizerQuery;

  StreamSubscription<Event> _onAcaraAddedSubscription;
  StreamSubscription<Event> _onUserAddedSubscription;
  StreamSubscription<Event> _onOrganizerAddedSubscription;

  @override
  void initState() {
    _eventCardIsUp = false;

    _acaraList = new List();
    _userList = new List();
    _organizerList = new List();

    _acaraQuery = db.reference().child("event").orderByChild("eventID");
    _userQuery = db.reference().child("user").orderByKey().equalTo(userID);

    _onAcaraAddedSubscription = _acaraQuery.onChildAdded.listen(onEntryAdded);
    _onUserAddedSubscription = _userQuery.onChildAdded.listen(onUserGet);
    super.initState();
  }

  onEntryAdded(Event acara) {
    setState(() {
      _acaraList.add(Acara.fromSnapshot(acara.snapshot));
    });
  }

  onUserGet(Event user) {
    setState(() {
      _userList.add(User.fromSnapshot(user.snapshot));
    });
  }

  _addEvent(String userID) {
    // Acara synchronity = new Acara(
    //     eventBenefits: 'E-certificate \nT-shirt \nGoodie Bag \nFree Ticket',
    //     eventCriteria: 'Gender: Male / Female \nAge: 18 - 35 years old',
    //     eventDate: 'Rabu, 18 Maret 2020',
    //     eventDesc:
    //         'Calling for volunteers! Let\'s become part of our team to support this charity concert. Your participation means a lot for those people in need. Don\'t miss the chance to have fun with us at #BiggestCharityVibes2020',
    //     eventDivision: divisi,
    //     eventName: 'Synchronity',
    //     eventOrganizer: 'Q5RVoN5fnfhZdYfDMyNl9QVo4rr2',
    //     eventPlace: 'Indonesia Convention Exhibition Center BSD',
    //     eventThumb:
    //         'https://firebasestorage.googleapis.com/v0/b/ever-a01f1.appspot.com/o/Banner%2FBanner_Synchronity.jpg?alt=media&token=1e7ca5c0-787b-479c-a2a1-e8e9709f3fb8',
    //     eventTime: '10:00-17:00',
    //     isNonProfit: false);

    // Acara rearthlity = new Acara(
    //     eventBenefits: 'E-Certificate\nLunch\nT-Shirt\nGoodie Bag',
    //     eventCriteria: 'Gender: Male / Female \nAge: 18 - 27 years old',
    //     eventDate: 'Sabtu, 7 Desember 2019',
    //     eventDesc:
    //         'Calling you yes, Photographers of #REARTHLITY! Let us participate to make a better place. Seek the truth of our earth. Let the windows open with your photography in #NARASI2019',
    //     eventDivision: divisi,
    //     eventName: 'Rearthlity',
    //     eventOrganizer: 'Q5RVoN5fnfhZdYfDMyNl9QVo4rr2',
    //     eventPlace: 'Soup n Film, Blok M, Jakarta Selatan',
    //     eventThumb:
    //         'https://firebasestorage.googleapis.com/v0/b/ever-a01f1.appspot.com/o/Banner%2FBanner_Rearthlity.jpg?alt=media&token=3954760b-e213-462e-b19b-6006580472ab',
    //     eventTime: '10:00 - 19:00',
    //     isNonProfit: false);

    // Acara computerRun = new Acara(
    //     eventBenefits: 'E-Certificate\nLunch\nT-Shirt\nMedal',
    //     eventCriteria: 'Gender: Male / Female \nAge: 17 - 24 years old',
    //     eventDate: 'Minggu, 6 Desember 2020',
    //     eventDesc: 'Ayo kita lari bareng sama komputer.',
    //     eventDivision: divisi,
    //     eventName: 'Computer Run',
    //     eventOrganizer: 'Q5RVoN5fnfhZdYfDMyNl9QVo4rr2',
    //     eventPlace: 'BINUS Alam Sutera',
    //     eventThumb:
    //         'https://firebasestorage.googleapis.com/v0/b/ever-a01f1.appspot.com/o/Banner%2FBanner_ComputerRun.jpg?alt=media&token=8391a7ec-7ccc-45f0-9795-7b117792fb8b',
    //     eventTime: '16:00 - 21:00',
    //     isNonProfit: false);

    List divisi = [
      {"divisionName": "Event", "divisionCapacity": 25},
      {"divisionName": "Funding", "divisionCapacity": 25},
      {"divisionName": "Documentation", "divisionCapacity": 20},
    ];

    // Acara hishot = new Acara(
    //     eventBenefits: 'E-Certificate\nLunch\nSAT\nKnowledge',
    //     eventCriteria: 'Gender: Male / Female \nAge: 18 - 21 years old',
    //     eventDate: 'Senin, 11 May 2020',
    //     eventDesc: 'HIMTI Seminar. Get SAT',
    //     eventDivision: divisi,
    //     eventName: 'HISHOT',
    //     eventOrganizer: 'Q5RVoN5fnfhZdYfDMyNl9QVo4rr2',
    //     eventPlace: 'Online',
    //     eventThumb:
    //         'https://firebasestorage.googleapis.com/v0/b/ever-a01f1.appspot.com/o/Banner%2FBanner_Hishot.jpg?alt=media&token=23923f8b-8a08-4660-9aca-0a2906c445ea',
    //     eventTime: '13:20 - 15:00',
    //     isNonProfit: true);

    //db.reference().child("event").push().set(hishot.toJson());
  }

  _removeEvent() {
    db.reference().child("event").child("3").remove().then((_) {
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
                  widget.notifyParent();
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
      backgroundColor: lightBackgroundColor,
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
          // print(
          //     'User Email: ${_userList[0].userEmail}\nUser Name: ${_userList[0].userName}');
          widget.notifyParent();
          print(_userList);
          //profileBottomSheet(context, _userList[0]);
        },
      ),
    );
  }
}
