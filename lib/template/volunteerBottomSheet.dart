import 'package:flutter/material.dart';
import 'package:Ever/template/colors.dart';

bool divisionChosen = false;

void volunteerThankyouBottomSheet(context) {
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
            color: darkBackgroundColor,
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

Widget divisionName(String name) {
  return FlatButton(
    child: Container(
      child: Center(
        child: Text(
          '$name',
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
          border: Border.all(color: divisionChosen ? orange : white, width: 5)),
      height: 35,
      width: 120,
    ),
    onPressed: () {},
  );
}

Widget shirtSize(String size) {
  return FlatButton(
    child: Container(
      child: Center(
        child: Text(
          '$size',
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
          border: Border.all(
              color: divisionChosen ? Colors.orange : white, width: 5)),
      height: 35,
      width: 35,
    ),
    onPressed: () {},
  );
}

void volunteerBottomSheet(context) {
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
            color: darkBackgroundColor,
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
                  return SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(30, 30, 0, 0),
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
                            alignment: WrapAlignment.start,
                            children: <Widget>[
                              divisionName('Documentation'),
                              divisionName('Public Relation'),
                              divisionName('Ticketing'),
                              divisionName('Logistic')
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
                            alignment: WrapAlignment.start,
                            children: <Widget>[
                              shirtSize('XS'),
                              shirtSize('S'),
                              shirtSize('M'),
                              shirtSize('L'),
                              shirtSize('XL'),
                            ],
                          ),
                          SizedBox(
                            height: 70,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    height: 70,
                    color: darkBackgroundColor,
                    child: Center(
                      child: Container(
                        width: 350,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                        child: FlatButton(
                          color: orange,
                          child: Text(
                            'Volunteer',
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                color: white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          onPressed: () {
                            volunteerThankyouBottomSheet(context);
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
