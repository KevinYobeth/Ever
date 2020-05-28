import 'package:flutter/material.dart';
import 'package:Ever/template/colors.dart';

bool _donateDone = false;

class donationSheet extends StatefulWidget {
  final String userOrgBankNumber;
  final String userOrgName;
  final String userOrgCP;

  const donationSheet(
      {Key key, this.userOrgBankNumber, this.userOrgName, this.userOrgCP})
      : super(key: key);

  @override
  _donationSheetState createState() =>
      _donationSheetState(userOrgBankNumber, userOrgName, userOrgCP);
}

class _donationSheetState extends State<donationSheet> {
  final String userOrgBankNumber;
  final String userOrgName;
  final String userOrgCP;

  _donationSheetState(this.userOrgBankNumber, this.userOrgName, this.userOrgCP);

  @override
  void initState() {
    _donateDone = false;
  }

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
        child: !_donateDone
            ? Stack(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(170, 10, 170, 0),
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
                      return Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 35.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Text('Please kindly transfer your donation to',
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      color: white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                              SizedBox(height: 30),
                              Text(userOrgBankNumber,
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      color: white,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold)),
                              Text('a/n',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: white,
                                    fontSize: 20,
                                  )),
                              Text(userOrgName,
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      color: white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                              SizedBox(height: 30),
                              Text(
                                'For more information contact ${userOrgCP}',
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  color: white,
                                  fontSize: 15,
                                ),
                              )
                            ],
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
                          borderRadius: BorderRadius.circular(10)),
                      child: FlatButton(
                        color: Colors.green,
                        child: Text(
                          'Done',
                          style: TextStyle(
                              color: white,
                              fontFamily: 'Montserrat',
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        onPressed: () {
                          setState(() {
                            _donateDone = true;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              )
            : Stack(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(170, 10, 170, 0),
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
                            padding: const EdgeInsets.symmetric(vertical: 60),
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
                                    'Thank you for your donation',
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
