import 'package:flutter/material.dart';
import 'package:Ever/template/colors.dart';
import 'package:Ever/template/orgEventCard.dart';

final scaffoldState = GlobalKey<ScaffoldState>();
bool _eventCardIsUp = false;

class orgHomePage extends StatefulWidget {
  @override
  _orgHomePageState createState() => _orgHomePageState();
}

class _orgHomePageState extends State<orgHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                          ),
                          onTap: (){

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
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        orgAddEventCard(),
                        orgEventCard(),
                      ],
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
                orgEventCard()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
