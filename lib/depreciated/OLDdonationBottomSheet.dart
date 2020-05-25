import 'package:flutter/material.dart';
import 'package:Ever/template/colors.dart';

void donationThankyouBottomSheet(context) {
  showModalBottomSheet(
    context: context,
    elevation: 0,
    backgroundColor: Colors.transparent,
    builder: (BuildContext bc) {
      return FractionallySizedBox(
        heightFactor: (MediaQuery.of(context).size.height * 0.6) /
            MediaQuery.of(context).size.height,
        child: Container(
          decoration: BoxDecoration(
            color: darkBlue,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Stack(
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
                builder:
                    (BuildContext context, ScrollController scrollController) {
                  return Wrap(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 50),
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
                bottom: 10,
                left: 30,
                right: 30,
                child: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  child: FlatButton(
                    color: Colors.grey[800],
                    child: Text(
                      'Return',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: white,
                        fontSize: 20,
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

void donationBottomSheet(context) {
  showModalBottomSheet(
    context: context,
    elevation: 0,
    backgroundColor: Colors.transparent,
    builder: (BuildContext bc) {
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
                builder:
                    (BuildContext context, ScrollController scrollController) {
                  return Wrap(
                    children: <Widget>[
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text('Please kindly transfer your donation to',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: white,
                                    fontSize: 15,
                                  )),
                              SizedBox(
                                height: 30,
                              ),
                              Text('123456789',
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      color: white,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold)),
                              SizedBox(
                                height: 20,
                              ),
                              Text('a/n',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: white,
                                    fontSize: 20,
                                  )),
                              Text('Mesyella',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: white,
                                    fontSize: 20,
                                  )),
                              SizedBox(
                                height: 15,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
              Positioned(
                bottom: 10,
                left: 30,
                right: 30,
                child: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  child: FlatButton(
                    color: Colors.green,
                    child: Text(
                      'Done',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: white,
                        fontSize: 20,
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                      donationThankyouBottomSheet(context);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
