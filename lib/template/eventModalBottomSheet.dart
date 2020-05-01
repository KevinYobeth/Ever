import 'package:flutter/material.dart';
import 'package:Ever/template/colors.dart';

Widget eventButton(isNonProfit) {
  if (isNonProfit == true) {
    return FlatButton(
      color: Colors.green,
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Text(
          'Be a Donator',
          style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 15,
              color: white,
              fontWeight: FontWeight.bold),
        ),
      ),
      onPressed: () {},
    );
  } else {
    return FlatButton(
      color: Colors.green,
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Text(
          'Be a Sponsor',
          style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 15,
              color: white,
              fontWeight: FontWeight.bold),
        ),
      ),
      onPressed: () {},
    );
  }
}

void eventModalBottomSheet(context,
    {String eventName,
    bool isNonProfit,
    String eventThumb,
    String eventDate,
    String eventPlace,
    String eventDesc,
    String criteria,
    String division,
    String benefits}) {
  showModalBottomSheet<dynamic>(
    context: context,
    isScrollControlled: true,
    elevation: 0,
    backgroundColor: Colors.transparent,
    builder: (BuildContext bc) {
      return DraggableScrollableSheet(
        initialChildSize: (MediaQuery.of(context).size.height - 120) /
            MediaQuery.of(context).size.height,
        maxChildSize: (MediaQuery.of(context).size.height - 120) /
            MediaQuery.of(context).size.height,
        minChildSize: (MediaQuery.of(context).size.height - 120 - 40) /
            MediaQuery.of(context).size.height,
        builder: (BuildContext context, ScrollController scrollController) {
          return SingleChildScrollView(
            controller: scrollController,
            child: Container(
              height: 950,
              decoration: BoxDecoration(
                  color: darkBackgroundColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  )),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Container(
                            height: 7,
                            width: 60,
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(255, 255, 255, 0.4),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                        top: 20,
                        left: 20,
                        right: 20,
                        child: Image(
                          image: NetworkImage(eventThumb),
                          height: 200,
                          width: 350,
                        )),
                    Positioned(
                      top: 220,
                      left: 20,
                      child: Text("$eventName",
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold)),
                    ),
                    Positioned(
                      top: 260,
                      left: 20,
                      child: Text("$eventDate",
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Colors.red,
                              fontSize: 13,
                              fontWeight: FontWeight.bold)),
                    ),
                    Positioned(
                      top: 280,
                      left: 20,
                      child: Text("$eventPlace",
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold)),
                    ),
                    Positioned(
                      top: 320,
                      left: 20,
                      child: Text("Description",
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold)),
                    ),
                    Positioned(
                      top: 350,
                      left: 20,
                      child: Text("$eventDesc",
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: white,
                              fontSize: 12)),
                    ),
                    Positioned(
                      top: 450,
                      left: 20,
                      child: Text("Criteria",
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold)),
                    ),
                    Positioned(
                      top: 480,
                      left: 20,
                      child: Text("$criteria",
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: white,
                              fontSize: 12)),
                    ),
                    Positioned(
                      top: 590,
                      left: 20,
                      child: Text("Division",
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold)),
                    ),
                    Positioned(
                      top: 620,
                      left: 20,
                      child: Text("$division",
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: white,
                              fontSize: 12)),
                    ),
                    Positioned(
                      top: 700,
                      left: 20,
                      child: Text("Benefits",
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold)),
                    ),
                    Positioned(
                      top: 730,
                      left: 20,
                      child: Text("$benefits",
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: white,
                              fontSize: 12)),
                    ),
                    Positioned(
                      top: 850,
                      left: 20,
                      right: 20,
                      child: Container(
                        height: 70,
                        child: Stack(
                          children: <Widget>[
                            Positioned(
                                left: 10,
                                top: 10,
                                bottom: 10,
                                right: 180,
                                child: eventButton(isNonProfit)),
                            Positioned(
                              right: 10,
                              top: 10,
                              bottom: 10,
                              left: 180,
                              child: FlatButton(
                                color: orange,
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Text(
                                    'Volunteer',
                                    style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontSize: 15,
                                        color: white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                onPressed: () {},
                              ),
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                            color: Colors.blueGrey[800],
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      );
    },
  );
}
