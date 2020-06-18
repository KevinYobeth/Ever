import 'dart:async';

import 'package:flutter/material.dart';
import 'package:Ever/template/colors.dart';

void sponsorThankyouBottomSheet(context) {
  showModalBottomSheet(
    context: context,
    elevation: 0,
    barrierColor: Color.fromRGBO(255, 255, 255, 0),
    backgroundColor: Colors.transparent,
    builder: (BuildContext bc) {},
  );
}

Widget packageDetail(packageDetails) {
  return Text(
    packageDetails,
    style: TextStyle(
      fontFamily: 'Montserrat',
      color: lighterGray,
      fontSize: 15,
    ),
  );
}

bool _sponsorDone = false;

class sponsorDetailSheet extends StatefulWidget {
  final String packageName;
  final String packageDetails;
  final int packagePrice;

  const sponsorDetailSheet(
      {Key key, this.packageName, this.packageDetails, this.packagePrice})
      : super(key: key);

  @override
  _sponsorDetailSheetState createState() =>
      _sponsorDetailSheetState(packageName, packagePrice, packageDetails);
}

class _sponsorDetailSheetState extends State<sponsorDetailSheet> {
  final String packageName;
  final String packageDetails;
  final int packagePrice;

  _sponsorDetailSheetState(
      this.packageName, this.packagePrice, this.packageDetails);

  @override
  Widget build(BuildContext context) {
    return !_sponsorDone
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
                      return SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                packageName,
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              packageDetail(packageDetails),
                              SizedBox(height: 100),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text(
                          'Rp. $packagePrice',
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(8.0, 10.0, 8.0, 20.0),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.0),
                                child: InkWell(
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: Text(
                                      'Be a Sponsor',
                                      style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.bold,
                                        color: white,
                                      ),
                                    ),
                                    height: 40.0,
                                    decoration: BoxDecoration(
                                        color: green,
                                        borderRadius:
                                            BorderRadius.circular(5.0)),
                                  ),
                                  onTap: () {
                                    setState(() {
                                      _sponsorDone = true;
                                    });
                                  },
                                ),
                              ),
                              flex: 3,
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(right: 10.0),
                                child: InkWell(
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: Text(
                                      'Return',
                                      style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.bold,
                                        color: white,
                                      ),
                                    ),
                                    height: 40.0,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[800],
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ),
                              flex: 2,
                            )
                          ],
                        ),
                      ),
                    ],
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
                                    'Thank you for your interest',
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
                          Navigator.pop(context);
                          Timer(Duration(seconds: 1), () {
                            _sponsorDone = false;
                          });
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

Widget sponsorContent(context, packageName, packagePrice, packageDetails) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 10, left: 10.0),
    child: Row(
      children: <Widget>[
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                packageName,
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                packageDetails,
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  color: lighterGray,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: FlatButton(
            child: Container(
              child: Center(
                child: Text(
                  'Details',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(5),
              ),
              height: 35,
              width: 115,
            ),
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  barrierColor: Color.fromRGBO(255, 255, 255, 0),
                  backgroundColor: Colors.transparent,
                  builder: (BuildContext context) {
                    return sponsorDetailSheet(
                      packageName: packageName,
                      packagePrice: packagePrice,
                      packageDetails: packageDetails,
                    );
                  });
            },
          ),
        ),
      ],
    ),
  );
}

class sponsorSheet extends StatefulWidget {
  final List sponsorList;

  const sponsorSheet({Key key, this.sponsorList}) : super(key: key);

  @override
  _sponsorSheetState createState() => _sponsorSheetState(sponsorList);
}

class _sponsorSheetState extends State<sponsorSheet> {
  final List sponsorList;

  _sponsorSheetState(this.sponsorList);

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
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
              padding: EdgeInsets.symmetric(horizontal: 180, vertical: 10),
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
              builder:
                  (BuildContext context, ScrollController scrollController) {
                return SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        for (var package in sponsorList)
                          sponsorContent(
                              context,
                              package['packageName'],
                              package['packagePrice'],
                              package['packageDetails']),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
