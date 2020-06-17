import 'dart:async';

import 'package:Ever/models/orgEvent.dart';
import 'package:Ever/models/user.dart';
import 'package:Ever/pages/home_page.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:Ever/template/colors.dart';
import 'package:Ever/template/orgEventCard.dart';

final scaffoldState = GlobalKey<ScaffoldState>();
bool _eventCardIsUp = false;
final FirebaseDatabase dtb = FirebaseDatabase.instance;

class orgHomePage extends StatefulWidget {
  final User userData;

  const orgHomePage({Key key, this.userData}) : super(key: key);

  @override
  _orgHomePageState createState() => _orgHomePageState(userData);
}

class _orgHomePageState extends State<orgHomePage> {
  List<OrgEvent> _orgEventList;

  Query _orgEventQuery;

  StreamSubscription<Event> _onOrgEventAddedSubscription;

  onOrgEventAdded(Event event) {
    setState(() {
      _orgEventList.add(OrgEvent.fromSnapshot(event.snapshot));
    });
  }

  @override
  void initState() {
    _orgEventList = new List();
    _orgEventQuery = dtb.reference().child("user/$userID/organizationEvent");
    _onOrgEventAddedSubscription =
        _orgEventQuery.onChildAdded.listen(onOrgEventAdded);
  }

  final User userData;

  _orgHomePageState(this.userData);

  refresh() {
    print('Hello');
    setState(() {
      _eventCardIsUp = !_eventCardIsUp;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: scaffoldState,
      backgroundColor: lightBackgroundColor,
      body: Column(
        children: <Widget>[
          AnimatedContainer(
            curve: Curves.fastOutSlowIn,
            duration: Duration(milliseconds: 400),
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
                                color: _eventCardIsUp ? black : white,
                                fontSize: 40,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        InkWell(
                          child: CircleAvatar(
                            radius: 20,
                            backgroundColor: lighterGray,
                            backgroundImage: NetworkImage(userData
                                        .userProfileImg ==
                                    'null'
                                ? 'https://firebasestorage.googleapis.com/v0/b/ever-a01f1.appspot.com/o/ProfileImg%2FDefaultProfile.jpg?alt=media&token=77cc3836-1483-46bf-9230-cf290f9395fb'
                                : userData.userProfileImg),
                          ),
                          onTap: () {
                            Navigator.pop(context);
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
              color:
                  _eventCardIsUp ? lightBackgroundColor : darkBackgroundColor,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                  child: Text(
                    'Upcoming Events',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: darkBackgroundColor,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: _orgEventList.length,
                    itemBuilder: (BuildContext context, int index) {
                      String eventName = _orgEventList[index].eventName;
                      String eventDate = _orgEventList[index].eventDate;
                      String eventThumb = _orgEventList[index].eventThumb;

                      DateTime eDate = DateTime.parse(eventDate);

                      if (index == 0) {
                        return addEvent(refresh: refresh);
                      }
                      index -= 1;

                      if (index == _orgEventList.length + 1) {
                        return addEvent(refresh: refresh);
                      }

                      if (_orgEventList.length > 0 &&
                          eDate.isAfter(DateTime.now())) {
                        return orgEventCard(
                          eventBanner: eventThumb,
                          eventDate: eventDate,
                        );
                      } else {
                        return Container();
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    'Past Events',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: darkBackgroundColor,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: _orgEventList.length,
                    itemBuilder: (BuildContext context, int index) {
                      String eventName = _orgEventList[index].eventName;
                      String eventDate = _orgEventList[index].eventDate;
                      String eventThumb = _orgEventList[index].eventThumb;
                      DateTime eDate = DateTime.parse(eventDate);

                      if (_orgEventList.length > 0 &&
                          eDate.isBefore(DateTime.now())) {
                        return orgEventCard(
                          eventBanner: eventThumb,
                          eventDate: eventDate,
                        );
                      } else {
                        return Container();
                      }
                    },
                  ),
                ),
                // addEvent(
                //   refresh: refresh,
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
