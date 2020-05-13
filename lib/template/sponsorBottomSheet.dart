import 'package:flutter/material.dart';
import 'package:Ever/template/colors.dart';

void sponsorThankyouBottomSheet(context) {
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

Widget packageDetail() {
  return Text(
    'Large logo on Banner (3pcs)',
    style: TextStyle(
      fontFamily: 'Montserrat',
      color: gray,
      fontSize: 15,
    ),
  );
}

void sponsorDetail(context) {
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
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Platinum Package',
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                color: white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          packageDetail(),
                          packageDetail(),
                          packageDetail(),
                          packageDetail(),
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
                    child: Container(
                      child: Text(
                        'Rp. 10.000.000',
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            color: white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                      color: darkBackgroundColor,
                    ),
                  ),
                  Container(
                    height: 70,
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          left: 10,
                          top: 10,
                          bottom: 10,
                          right: 210,
                          child: FlatButton(
                            color: Colors.green,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                'Be a Sponsor',
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 15,
                                    color: white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            onPressed: () {
                              sponsorThankyouBottomSheet(context);
                            },
                          ),
                        ),
                        Positioned(
                          right: 10,
                          top: 10,
                          bottom: 10,
                          left: 210,
                          child: FlatButton(
                            color: Colors.grey[800],
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                'Return',
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 15,
                                    color: white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                        color: darkBackgroundColor,
                        borderRadius: BorderRadius.circular(10)),
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

Widget sponsorContent(context) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Platinum Package',
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                'Large size Banner, Adlips, Logo in shirts and nametag, 3 x 4 stand',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  color: gray,
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
                  'Sponsor',
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
              sponsorDetail(context);
            },
          ),
        ),
      ],
    ),
  );
}

void sponsorBottomSheet(
  context, {
  String packageName,
  String packageContent,
  String packagePrice,
}) {
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
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          sponsorContent(context),
                          sponsorContent(context),
                          sponsorContent(context),
                          sponsorContent(context),
                          sponsorContent(context),
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
    },
  );
}
