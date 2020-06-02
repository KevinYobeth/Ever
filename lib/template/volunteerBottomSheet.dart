import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:Ever/template/colors.dart';

bool _volunteerDone = false;
List<divisionRadio> divisions = List<divisionRadio>();

String _divisionName;
String _shirtSize;

final FirebaseDatabase db = FirebaseDatabase.instance;

class divisionRadio extends StatefulWidget {
  bool isSelected;
  String divisionName;
  int index;

  divisionRadio({Key key, this.isSelected, this.divisionName, this.index})
      : super(key: key);

  @override
  _divisionRadioState createState() =>
      _divisionRadioState(isSelected, divisionName, index);
}

class _divisionRadioState extends State<divisionRadio> {
  bool isSelected;
  String divisionName;
  int index;

  _divisionRadioState(this.isSelected, this.divisionName, this.index);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        child: Center(
          child: Text(
            '$divisionName',
            style: TextStyle(
                fontFamily: 'Montserrat',
                color: Colors.grey[700],
                fontSize: 10,
                fontWeight: FontWeight.bold),
          ),
        ),
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: green,
            width: isSelected ? 3 : 0,
          ),
        ),
        height: 35,
        width: 100,
      ),
      onTap: () {
        //print(divisions[index].divisionName);
        setState(() {
          divisions.forEach((element) {
            element.isSelected = false;
          });
          divisions[index].isSelected = true;
          _divisionName = divisions[index].divisionName;
          //print(_divisionName);
        });
      },
    );
  }
}

class shirtRadio extends StatefulWidget {
  bool isSelected;
  String shirtSize;
  int index;

  shirtRadio({Key key, this.isSelected, this.shirtSize, this.index})
      : super(key: key);

  @override
  _shirtRadioState createState() =>
      _shirtRadioState(isSelected, shirtSize, index);
}

class _shirtRadioState extends State<shirtRadio> {
  bool isSelected;
  String shirtSize;
  int index;

  _shirtRadioState(this.isSelected, this.shirtSize, this.index);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        child: Center(
          child: Text(
            '$shirtSize',
            style: TextStyle(
                fontFamily: 'Montserrat',
                color: Colors.grey[700],
                fontSize: 11,
                fontWeight: FontWeight.bold),
          ),
        ),
        decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: green, width: isSelected ? 3 : 0)),
        height: 35,
        width: 35,
      ),
      onTap: () {
        setState(() {
          this.isSelected = !this.isSelected;
          if (isSelected) {
            _shirtSize = this.shirtSize;
          } else {
            _shirtSize = '';
          }
        });
        //print(_shirtSize);
      },
    );
  }
}

class volunteerSheet extends StatefulWidget {
  final String eventID;
  final List divisionList;
  final String userID;
  final String eventName;
  final String eventThumb;
  final String eventDate;
  final bool volunteerDone;

  const volunteerSheet(
      {Key key,
      this.eventID,
      this.divisionList,
      this.userID,
      this.eventName,
      this.eventThumb,
      this.eventDate,
      this.volunteerDone})
      : super(key: key);

  @override
  _volunteerSheetState createState() => _volunteerSheetState(eventID,
      divisionList, userID, eventName, eventThumb, eventDate, volunteerDone);
}

class _volunteerSheetState extends State<volunteerSheet> {
  final String eventID;
  final List divisionList;
  final String userID;
  final String eventName;
  final String eventThumb;
  final String eventDate;
  final bool volunteerDone;

  _volunteerSheetState(this.eventID, this.divisionList, this.userID,
      this.eventName, this.eventThumb, this.eventDate, this.volunteerDone);

  @override
  void initState() {
    if (volunteerDone) {
      _volunteerDone = true;
    } else {
      _volunteerDone = false;
    }

    if (divisions.isEmpty) {
      for (int i = 0; i < divisionList.length; i++)
        divisions.add(divisionRadio(
          divisionName: divisionList[i]['divisionName'],
          isSelected: false,
          index: i,
        ));
    }

    divisions.forEach((element) {
      element.isSelected = false;
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return !_volunteerDone
        ? FractionallySizedBox(
            heightFactor: (MediaQuery.of(context).size.height * 0.8) /
                MediaQuery.of(context).size.height,
            child: Container(
              decoration: BoxDecoration(
                color: cardBlue,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Stack(
                children: <Widget>[
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 180, vertical: 10),
                    child: Container(
                      height: 7,
                      width: 60,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(255, 255, 255, 0.4),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  DraggableScrollableSheet(
                    initialChildSize: 0.95,
                    minChildSize: 0.5,
                    builder: (BuildContext context,
                        ScrollController scrollController) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(30, 10, 0, 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Select Available Division',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Wrap(
                                  spacing: 10.0,
                                  runSpacing: 10.0,
                                  children: <Widget>[
                                    for (var div in divisions) div
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  'Select Shirt Size',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Wrap(
                                  spacing: 15.0,
                                  children: <Widget>[
                                    shirtRadio(
                                        index: 0,
                                        isSelected: false,
                                        shirtSize: 'XS'),
                                    shirtRadio(
                                        index: 1,
                                        isSelected: false,
                                        shirtSize: 'S'),
                                    shirtRadio(
                                        index: 2,
                                        isSelected: false,
                                        shirtSize: 'M'),
                                    shirtRadio(
                                        index: 3,
                                        isSelected: false,
                                        shirtSize: 'L'),
                                    shirtRadio(
                                        index: 4,
                                        isSelected: false,
                                        shirtSize: 'XL'),
                                  ],
                                ),
                                SizedBox(
                                  height: 70,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  Positioned(
                    bottom: 20,
                    left: 30,
                    right: 30,
                    child: Container(
                      height: 45.0,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                            gradientLighterOrange,
                            gradientDarkerOrange
                          ]),
                          borderRadius: BorderRadius.circular(10)),
                      child: FlatButton(
                        child: Text(
                          'Volunteer',
                          style: TextStyle(
                              color: white,
                              fontFamily: 'Montserrat',
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        onPressed: () {
                          setState(() {
                            if (_divisionName != null && _shirtSize != null) {
                              Map userSide = {
                                "userDivision": _divisionName,
                                "userShirtSize": _shirtSize,
                                "volunteerDate": DateTime.now().toString(),
                                "eventName": eventName,
                                "eventThumb": eventThumb,
                                "eventDate": eventDate,
                                "eventID": eventID
                              };

                              Map eventSide = {
                                "userDivision": _divisionName,
                                "userShirtSize": _shirtSize,
                                "volunteerDate": DateTime.now().toString()
                              };

                              db
                                  .reference()
                                  .child("user/$userID/userEvent/$eventID")
                                  .set(userSide);

                              db
                                  .reference()
                                  .child(
                                      "event/$eventID/eventVolunteer/$userID")
                                  .set(eventSide);
                              _volunteerDone = true;
                            }
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        : FractionallySizedBox(
            heightFactor: (MediaQuery.of(context).size.height * 0.8) /
                MediaQuery.of(context).size.height,
            child: Container(
              decoration: BoxDecoration(
                color: cardBlue,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Stack(
                children: <Widget>[
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 180, vertical: 10),
                    child: Container(
                      height: 7,
                      width: 60,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(255, 255, 255, 0.4),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  DraggableScrollableSheet(
                    initialChildSize: 0.95,
                    minChildSize: 0.5,
                    builder: (BuildContext context,
                        ScrollController scrollController) {
                      return Wrap(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(50, 50, 50, 0),
                            child: Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                    size: 70,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Thank you for your participation',
                                    style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontSize: 15,
                                        color: white),
                                  ),
                                  Text(
                                    'Kindly check your notification ',
                                    style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontSize: 15,
                                        color: white),
                                  ),
                                  Text(
                                    'for further notice',
                                    style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontSize: 15,
                                        color: white),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                  Positioned(
                    bottom: 20,
                    left: 30,
                    right: 30,
                    child: Container(
                      height: 45.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)),
                      child: FlatButton(
                        color: Colors.grey[800],
                        child: Text(
                          'Return',
                          style: TextStyle(
                              color: white,
                              fontFamily: 'Montserrat',
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
