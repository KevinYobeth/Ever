import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:Ever/template/colors.dart';
import 'package:Ever/template/eventCard.dart';
import 'package:Ever/template/donationBottomSheet.dart';
import 'package:Ever/template/sponsorBottomSheet.dart';
import 'package:Ever/template/volunteerBottomSheet.dart';


Widget divisionContent(List division) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      for (var div in division)
        Text(
          div['divisionName'].toString(),
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 12,
            color: white,
          ),
        )
    ],
  );
}

class eventDetail extends StatefulWidget {
  final String eventName;
  final bool isNonProfit;
  final String eventThumb;
  final String eventDate;
  final String eventTime;
  final String eventPlace;
  final String eventDesc;
  final String eventCriteria;
  final List eventDivision;
  final List eventSponsor;
  final String eventBenefits;
  final String eventOrganizer;
  final String packageName;
  final String packageContent;
  final String packagePrice;

  const eventDetail(
      {Key key,
      this.eventName,
      this.isNonProfit,
      this.eventThumb,
      this.eventDate,
      this.eventTime,
      this.eventPlace,
      this.eventDesc,
      this.eventCriteria,
      this.eventDivision,
      this.eventSponsor,
      this.eventBenefits,
      this.eventOrganizer,
      this.packageName,
      this.packageContent,
      this.packagePrice})
      : super(key: key);

  @override
  _eventDetailState createState() => _eventDetailState(
      eventName,
      isNonProfit,
      eventThumb,
      eventDate,
      eventTime,
      eventPlace,
      eventDesc,
      eventCriteria,
      eventDivision,
      eventSponsor,
      eventBenefits,
      eventOrganizer,
      packageName,
      packageContent,
      packagePrice);
}

class _eventDetailState extends State<eventDetail> {
  @override
  void initState() {
    fetchOrganization();
  }

  final String eventName;
  final bool isNonProfit;
  final String eventThumb;
  final String eventDate;
  final String eventTime;
  final String eventPlace;
  final String eventDesc;
  final String eventCriteria;
  final List eventDivision;
  final List eventSponsor;
  final String eventBenefits;
  final String eventOrganizer;
  final String packageName;
  final String packageContent;
  final String packagePrice;

  _eventDetailState(
      this.eventName,
      this.isNonProfit,
      this.eventThumb,
      this.eventDate,
      this.eventTime,
      this.eventPlace,
      this.eventDesc,
      this.eventCriteria,
      this.eventDivision,
      this.eventSponsor,
      this.eventBenefits,
      this.eventOrganizer,
      this.packageName,
      this.packageContent,
      this.packagePrice);

  String _eventOrganizerName = '{Organizer Name}';
  String _organizationNumber = '{Organization Number}';
  String _organizationName = '{Organization Name}';
  String _organizationCP = '{Organization CP}';

  fetchOrganization() {
    final DatabaseReference db = FirebaseDatabase.instance.reference();
    db
        .child("user/$eventOrganizer/organizationID")
        .once()
        .then((DataSnapshot data) {
      setState(() {
        _eventOrganizerName = data.value;
        _organizationName = data.value;
      });
    });

    db
        .child("user/$eventOrganizer/organizationNumber")
        .once()
        .then((DataSnapshot data) {
      setState(() {
        _organizationNumber = data.value;
      });
    });

    db.child("user/$eventOrganizer/userPhone").once().then((DataSnapshot data) {
      setState(() {
        _organizationCP = data.value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FractionallySizedBox(
        heightFactor: (MediaQuery.of(context).size.height - 120.0) /
            MediaQuery.of(context).size.height,
        child: Container(
          height: 1000,
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
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(30, 0, 30, 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(eventThumb)),
                                  borderRadius: BorderRadius.circular(10)),
                              width: 350,
                              height: 180,
                              child: Stack(
                                children: <Widget>[
                                  Positioned(
                                      right: 10.0,
                                      bottom: 10.0,
                                      child: isNonProfit
                                          ? eventType(isNonProfit)
                                          : Text('')),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text("$eventName",
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  color: white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                )),
                            Text("$eventDate, $eventTime",
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: Colors.red,
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold)),
                            Text("$eventPlace",
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(
                              height: 30,
                            ),
                            Text("Description",
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold)),
                            Text("$eventDesc",
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: white,
                                    fontSize: 12)),
                            SizedBox(
                              height: 20,
                            ),
                            Text("Criteria",
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold)),
                            Text("$eventCriteria",
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: white,
                                    fontSize: 12)),
                            SizedBox(
                              height: 20,
                            ),
                            Text("Division",
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold)),
                            divisionContent(eventDivision),
                            SizedBox(
                              height: 20,
                            ),
                            Text("Benefits",
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold)),
                            Text("$eventBenefits",
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: white,
                                    fontSize: 12)),
                            SizedBox(
                              height: 20,
                            ),
                            Text("Event Organized by: $_eventOrganizerName",
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(
                              height: 80,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      height: 60.0,
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.0),
                              child: InkWell(
                                child: Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    isNonProfit
                                        ? 'Be a Donator'
                                        : 'Be a Sponsor',
                                    style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.bold,
                                      color: white,
                                    ),
                                  ),
                                  height: 40.0,
                                  decoration: BoxDecoration(
                                      color: green,
                                      borderRadius: BorderRadius.circular(5.0)),
                                ),
                                onTap: () {
                                  isNonProfit
                                      ? showModalBottomSheet(
                                          context: context,
                                          barrierColor:
                                              Color.fromRGBO(255, 255, 255, 0),
                                          backgroundColor: Colors.transparent,
                                          builder: (BuildContext context) {
                                            return donationSheet(
                                              userOrgBankNumber:
                                                  _organizationNumber,
                                              userOrgCP: _organizationCP,
                                              userOrgName: _organizationName,
                                            );
                                          },
                                        )
                                      : showModalBottomSheet(
                                          context: context,
                                          barrierColor:
                                              Color.fromRGBO(255, 255, 255, 0),
                                          backgroundColor: Colors.transparent,
                                          builder: (BuildContext context) {
                                            return sponsorSheet(
                                                sponsorList: eventSponsor);
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
                                    'Volunteer',
                                    style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.bold,
                                      color: white,
                                    ),
                                  ),
                                  height: 40.0,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(colors: [
                                      gradientLighterOrange,
                                      gradientDarkerOrange
                                    ]),
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                ),
                                onTap: () {
                                  showModalBottomSheet(
                                      context: context,
                                      backgroundColor: Colors.transparent,
                                      barrierColor:
                                          Color.fromRGBO(255, 255, 255, 0),
                                      builder: (BuildContext context) {
                                        return volunteerSheet(
                                          divisionList: eventDivision,
                                        );
                                      });
                                },
                              ),
                            ),
                            flex: 2,
                          )
                        ],
                      ),
                      decoration: BoxDecoration(
                        color: darkBlue,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
