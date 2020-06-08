import 'dart:io';

import 'package:Ever/models/acara.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:Ever/template/colors.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

String _eventName;
String _eventDate;
String _eventTime;
String _eventLocation;
String _eventDescription;
String _eventBenefits;
String _eventGenderReq;
String _eventAgeMinReq;
String _eventAgeMaxReq;
List<String> _eventDivisionName = List<String>();
List<String> _eventDivisionMax = List<String>();

List<String> _eventPackageName = List<String>();
List<String> _eventPackagePrice = List<String>();
List<String> _eventPackageDesc = List<String>();

String _eventAccountNum;
String _eventBannerURL;
String _eventOrganizerID;
bool _eventNonProfit;

final _page1 = new GlobalKey<FormState>();
final _page2 = new GlobalKey<FormState>();
final _page3 = new GlobalKey<FormState>();
final _page4 = new GlobalKey<FormState>();
final _page5 = new GlobalKey<FormState>();
final _page6 = new GlobalKey<FormState>();
final _page7 = new GlobalKey<FormState>();

class addEventDetail extends StatefulWidget {
  @override
  _addEventDetailState createState() => _addEventDetailState();
}

class _addEventDetailState extends State<addEventDetail> {
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: (MediaQuery.of(context).size.height - 120.0) /
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 20.0),
                Padding(
                  padding: const EdgeInsets.fromLTRB(25, 10, 0, 15),
                  child: Text(
                    'Create Event',
                    style: TextStyle(
                      color: white,
                      fontSize: 30,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      InkWell(
                        child: Container(
                          child: Center(
                            child: Text(
                              'Non-Profit',
                              style: TextStyle(
                                color: darkBackgroundColor,
                                fontSize: 15,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          height: 50,
                          width: 160,
                          decoration: BoxDecoration(
                              color: white,
                              borderRadius: BorderRadius.circular(5)),
                        ),
                        onTap: () {
                          _eventNonProfit = true;
                          showModalBottomSheet(
                              context: context,
                              backgroundColor: Colors.transparent,
                              barrierColor: Color.fromRGBO(255, 255, 255, 0),
                              builder: (BuildContext context) {
                                return orgCreateEvent(isNonProfit: true);
                              });
                        },
                      ),
                      Spacer(),
                      InkWell(
                        child: Container(
                          child: Center(
                            child: Text(
                              'Profit',
                              style: TextStyle(
                                color: darkBackgroundColor,
                                fontSize: 15,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          height: 50,
                          width: 160,
                          decoration: BoxDecoration(
                              color: white,
                              borderRadius: BorderRadius.circular(5)),
                        ),
                        onTap: () {
                          _eventNonProfit = false;
                          showModalBottomSheet(
                              context: context,
                              backgroundColor: Colors.transparent,
                              barrierColor: Color.fromRGBO(255, 255, 255, 0),
                              builder: (BuildContext context) {
                                return orgCreateEvent(isNonProfit: false);
                              });
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class orgCreateEvent extends StatefulWidget {
  final bool isNonProfit;

  const orgCreateEvent({Key key, this.isNonProfit}) : super(key: key);

  @override
  _orgCreateEventState createState() => _orgCreateEventState(isNonProfit);
}

class _orgCreateEventState extends State<orgCreateEvent> {
  int _pageContinue = 0;

  final bool isNonProfit;

  _orgCreateEventState(this.isNonProfit);

  Widget showEventnameInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 33),
          child: Text(
            'Event Name',
            style: TextStyle(
              color: darkBackgroundColor,
              fontSize: 15,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 8.0),
          child: new TextFormField(
            maxLines: 1,
            obscureText: false,
            autofocus: false,
            decoration: new InputDecoration(
                hintText: 'Event Name',
                icon: new Icon(
                  Icons.account_circle,
                  color: Colors.grey,
                )),
            validator: (value) {
              if (value.length < 4)
                return 'Event name must contain more than 4 letters.';
              else
                return null;
            },
            onSaved: (value) {
              _eventName = value.trim();
            },
          ),
        ),
      ],
    );
  }

  Widget showEventDateInput() {
    return Padding(
      padding: const EdgeInsets.only(left: 33.0, bottom: 8),
      child: Row(
        children: <Widget>[
          Icon(
            Icons.calendar_today,
            color: Colors.grey,
          ),
          _eventDate == null
              ? Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: FlatButton(
                    color: Colors.grey[300],
                    child: Text('Event Date'),
                    onPressed: () {
                      showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime.now(),
                              lastDate: DateTime(DateTime.now().year + 2))
                          .then((date) {
                        setState(() {
                          if (date != null) _eventDate = date.toString();
                        });
                      });
                    },
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: FlatButton(
                    color: Colors.grey[300],
                    child: Text(DateFormat('dd MMM yyyy')
                        .format(DateTime.parse(_eventDate))),
                    onPressed: () {
                      showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime.now(),
                              lastDate: DateTime(DateTime.now().year + 2))
                          .then((date) {
                        setState(() {
                          _eventDate = date.toString();
                        });
                      });
                    },
                  ),
                ),
          _eventTime == null
              ? Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: FlatButton(
                    color: Colors.grey[300],
                    child: Text('Event Time'),
                    onPressed: () {
                      showTimePicker(
                              context: context, initialTime: TimeOfDay.now())
                          .then((time) {
                        setState(() {
                          if (time != null) _eventTime = time.toString();
                        });
                      });
                    },
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: FlatButton(
                    color: Colors.grey[300],
                    child: Text(_eventTime.substring(10, 15)),
                    onPressed: () {
                      showTimePicker(
                              context: context, initialTime: TimeOfDay.now())
                          .then((time) {
                        setState(() {
                          _eventTime = time.toString();
                        });
                      });
                    },
                  ),
                ),
        ],
      ),
    );
  }

  Widget showEventLocationInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 33),
          child: Text(
            'Event Location',
            style: TextStyle(
              color: darkBackgroundColor,
              fontSize: 15,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 8.0),
          child: new TextFormField(
            maxLines: 1,
            obscureText: false,
            autofocus: false,
            decoration: new InputDecoration(
                hintText: 'Event Location',
                icon: new Icon(
                  Icons.location_on,
                  color: Colors.grey,
                )),
            validator: (value) {},
            onSaved: (value) {
              _eventLocation = value.trim();
            },
          ),
        ),
      ],
    );
  }

  Widget showDescriptionInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Text(
            'Event Description',
            style: TextStyle(
              color: darkBackgroundColor,
              fontSize: 15,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 8.0),
          child: new TextFormField(
            maxLines: 4,
            obscureText: false,
            autofocus: false,
            decoration: new InputDecoration(
              hintText: 'Description',
            ),
            validator: (value) {
              if (value.length < 10)
                return 'Event description must contain more than 10 letters.';
              else
                return null;
            },
            onSaved: (value) {
              _eventDescription = value.trim();
            },
          ),
        ),
      ],
    );
  }

  Widget showBenefitsInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Text(
            'Event Benefits',
            style: TextStyle(
              color: darkBackgroundColor,
              fontSize: 15,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 8.0),
          child: new TextFormField(
            maxLines: 4,
            obscureText: false,
            autofocus: false,
            decoration: new InputDecoration(
              hintText: 'Benefits (Use, to create new line)',
            ),
            validator: (value) {
              if (value.length == 0) {
                return 'Event benefits must contain something';
              } else {
                return null;
              }
            },
            onSaved: (value) {
              _eventBenefits = value.replaceAll(',', r'\n').trim();
            },
          ),
        ),
      ],
    );
  }

  Widget showAgeInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Text(
            'Age Criteria',
            style: TextStyle(
              color: darkBackgroundColor,
              fontSize: 15,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Row(
          children: <Widget>[
            Expanded(child: showMinInput()),
            Expanded(child: showMaxInput()),
          ],
        )
      ],
    );
  }

  Widget showMinInput() {
    return Padding(
      padding: EdgeInsets.fromLTRB(30.0, 0.0, 10.0, 8.0),
      child: new TextFormField(
        maxLines: 1,
        obscureText: false,
        autofocus: false,
        decoration: new InputDecoration(
          hintText: 'Min',
        ),
        validator: (value) {},
        onSaved: (value) {
          _eventAgeMinReq = value.trim();
        },
      ),
    );
  }

  Widget showMaxInput() {
    return Padding(
      padding: EdgeInsets.fromLTRB(10.0, 0.0, 30.0, 8.0),
      child: new TextFormField(
        maxLines: 1,
        obscureText: false,
        autofocus: false,
        decoration: new InputDecoration(
          hintText: 'Max',
        ),
        validator: (value) {},
        onSaved: (value) {
          _eventAgeMaxReq = value.trim();
        },
      ),
    );
  }

  Widget showDivisionInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Text(
            'Division',
            style: TextStyle(
              color: darkBackgroundColor,
              fontSize: 15,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Row(
          children: <Widget>[
            Expanded(flex: 5, child: showDivisionNameInput()),
            Expanded(flex: 2, child: showDivisionMaxInput()),
          ],
        )
      ],
    );
  }

  Widget showDivisionNameInput() {
    return Padding(
      padding: EdgeInsets.fromLTRB(30.0, 0.0, 10.0, 8.0),
      child: new TextFormField(
        maxLines: 1,
        obscureText: false,
        autofocus: false,
        decoration: new InputDecoration(
          hintText: 'Division Name',
        ),
        validator: (value) {},
        onSaved: (value) {
          _eventDivisionName.add(value.trim());
        },
      ),
    );
  }

  Widget showDivisionMaxInput() {
    return Padding(
      padding: EdgeInsets.fromLTRB(0.0, 0.0, 30.0, 8.0),
      child: new TextFormField(
        maxLines: 1,
        obscureText: false,
        autofocus: false,
        decoration: new InputDecoration(
          hintText: 'Max',
        ),
        validator: (value) {},
        onSaved: (value) {
          _eventDivisionMax.add(value.trim());
        },
      ),
    );
  }

  Widget showAccountInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Text(
            'Event Account Number',
            style: TextStyle(
              color: darkBackgroundColor,
              fontSize: 15,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 8.0),
          child: new TextFormField(
            maxLines: 1,
            obscureText: false,
            autofocus: false,
            decoration: new InputDecoration(
              hintText: 'Account Number',
            ),
            validator: (value) {
              if (value.length < 10) {
                return 'Account number must be more than 10 characters';
              } else {
                return null;
              }
            },
            onSaved: (value) {
              _eventAccountNum = value.trim();
            },
          ),
        ),
      ],
    );
  }

  Widget showPackageNameInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Text(
            'Package Name',
            style: TextStyle(
              color: darkBackgroundColor,
              fontSize: 15,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 8.0),
          child: new TextFormField(
            maxLines: 1,
            obscureText: false,
            autofocus: false,
            decoration: new InputDecoration(
              hintText: 'Package Name',
            ),
            validator: (value) {
              if (value.length < 4) {
                return 'Package name must be longer than 4 characters';
              } else {
                return null;
              }
            },
            onSaved: (value) {
              _eventPackageName.add(value.trim());
            },
          ),
        ),
      ],
    );
  }

  Widget showPackagePriceInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Text(
            'Package Price',
            style: TextStyle(
              color: darkBackgroundColor,
              fontSize: 15,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 8.0),
          child: new TextFormField(
            maxLines: 1,
            obscureText: false,
            autofocus: false,
            decoration: new InputDecoration(
              hintText: 'Package Price',
            ),
            validator: (value) {},
            onSaved: (value) {
              _eventPackagePrice.add(value.trim());
            },
          ),
        ),
      ],
    );
  }

  Widget showPackageDescInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Text(
            'Package Description',
            style: TextStyle(
              color: darkBackgroundColor,
              fontSize: 15,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 8.0),
          child: new TextFormField(
            maxLines: 1,
            obscureText: false,
            autofocus: false,
            decoration: new InputDecoration(
              hintText: 'Package Description (Use, to create new line)',
            ),
            validator: (value) {
              if (value.length < 4) {
                return 'Package description must be longer than 4 characters';
              } else {
                return null;
              }
            },
            onSaved: (value) {
              _eventPackageDesc.add(value.trim());
            },
          ),
        ),
      ],
    );
  }

  Widget continueButton() {
    return Container(
      height: 35,
      width: 100,
      child: Center(
        child: Text(
          'Continue',
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 12,
            color: white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [gradientLighterOrange, gradientDarkerOrange]),
          borderRadius: BorderRadius.circular(20)),
    );
  }

  Widget addButton(int page) {
    return Container(
      height: 35,
      width: 100,
      child: Center(
        child: Text(
          'Add More',
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 12,
            color: white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      decoration:
          BoxDecoration(color: black, borderRadius: BorderRadius.circular(20)),
    );
  }

  bool maleVal = false;
  bool femaleVal = false;

  Widget showGenderInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Text(
            'Gender Criteria',
            style: TextStyle(
              color: darkBackgroundColor,
              fontSize: 15,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.0),
          child: Row(
            children: <Widget>[
              Checkbox(
                value: maleVal,
                onChanged: (bool value) {
                  setState(() {
                    maleVal = value;
                  });
                },
              ),
              Text(
                'Male',
                style: TextStyle(
                    fontFamily: 'Montserrat', fontWeight: FontWeight.bold),
              ),
              Checkbox(
                value: femaleVal,
                onChanged: (bool value) {
                  setState(() {
                    femaleVal = value;
                  });
                },
              ),
              Text(
                'Female',
                style: TextStyle(
                    fontFamily: 'Montserrat', fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ],
    );
  }

  File _image;
  Future getImage(bool isCamera) async {
    File image;
    if (isCamera) {
      image = await ImagePicker.pickImage(source: ImageSource.camera);
    } else {
      image = await ImagePicker.pickImage(source: ImageSource.gallery);
    }
    setState(() {
      _image = image;
    });
  }

  bool _uploaded = false;
  Future uploadImage() async {
    StorageReference _reference =
        FirebaseStorage.instance.ref().child('/Banner/Banner_$_eventName');
    StorageUploadTask uploadTask = _reference.putFile(_image);
    StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
    _uploaded = true;
    String downloadAddress = await _reference.getDownloadURL();
    setState(() {
      _eventBannerURL = downloadAddress;
    });
    print(_eventBannerURL);
  }

  Widget showUploadBanner() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: InkWell(
            child: Container(
              alignment: Alignment.center,
              height: 180.0,
              width: 350.0,
              child: _eventBannerURL == null
                  ? Text(
                      'Event Banner (700 x 360)',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold),
                    )
                  : Image(
                      image: NetworkImage(_eventBannerURL),
                    ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: lightBackgroundColor,
              ),
            ),
            onTap: () {
              getImage(false).then((value) {
                uploadImage();
              });
            },
          ),
        ),
      ],
    );
  }

  void _addEvent(
      {eventBenefits,
      eventGenderReq,
      eventAgeMinReq,
      eventAgeMaxReq,
      eventDate,
      eventDescription,
      eventDivision,
      eventName,
      eventOrganizer,
      eventLocation,
      eventBanner,
      eventTime,
      eventNonProfit,
      eventSponsor}) {
    final FirebaseDatabase db = FirebaseDatabase.instance;

    Acara event = new Acara(
        eventBenefits: eventBenefits,
        eventCriteria:
            'Gender: $eventGenderReq \nAge: $eventAgeMinReq - $eventAgeMaxReq years old',
        eventDate: eventDate,
        eventDesc: eventDescription,
        eventDivision: eventDivision,
        eventSponsor: eventSponsor,
        eventName: eventName,
        eventOrganizer: eventOrganizer,
        eventPlace: eventLocation,
        eventThumb: eventBanner,
        eventTime: eventTime,
        isNonProfit: eventNonProfit);

    var key = db.reference().child("event").push();
    key.set(event.toJson());

    db.reference().child("user/");
  }

  void getUID() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    setState(() {
      _eventOrganizerID = user.uid;
    });
  }

  @override
  void initState() {
    getUID();
    _eventName;
    _eventDate;
    _eventTime;
    _eventLocation;
    _eventDescription;
    _eventBenefits;
    _eventGenderReq;
    _eventAgeMinReq;
    _eventAgeMaxReq;
    _eventDivisionName = List<String>();
    _eventDivisionMax = List<String>();

    _eventAccountNum;
    _eventPackageName;
    _eventPackagePrice;
    _eventPackageDesc;
    _eventBannerURL;
    _eventOrganizerID;
    _eventNonProfit;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: white,
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
                color: lighterGray,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.95,
            minChildSize: 0.5,
            builder: (BuildContext context, ScrollController scrollController) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: _pageContinue == 0
                      ? Form(
                          autovalidate: true,
                          key: _page1,
                          child: Column(
                            children: <Widget>[
                              showEventnameInput(),
                              showEventDateInput(),
                              showEventLocationInput(),
                              Padding(
                                padding: const EdgeInsets.only(left: 250),
                                child: FlatButton(
                                  child: continueButton(),
                                  onPressed: () {
                                    setState(() {
                                      if (_page1.currentState.validate()) {
                                        _page1.currentState.save();
                                        _pageContinue = 1;
                                      }
                                    });
                                    //orgAddDescription(context, isNonProfit);
                                  },
                                ),
                              ),
                            ],
                          ),
                        )
                      : _pageContinue == 1
                          ? Form(
                              autovalidate: true,
                              key: _page2,
                              child: Column(
                                children: <Widget>[
                                  showDescriptionInput(),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 250),
                                    child: FlatButton(
                                        onPressed: () {
                                          //orgAddBenefits(context, isNonProfit);
                                          setState(() {
                                            if (_page2.currentState
                                                .validate()) {
                                              _page2.currentState.save();
                                              _pageContinue = 2;
                                            }
                                          });
                                        },
                                        child: continueButton()),
                                  ),
                                ],
                              ),
                            )
                          : _pageContinue == 2
                              ? Form(
                                  autovalidate: true,
                                  key: _page3,
                                  child: Column(
                                    children: <Widget>[
                                      showBenefitsInput(),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 250),
                                        child: FlatButton(
                                            onPressed: () {
                                              //orgAddBenefits(context, isNonProfit);
                                              setState(() {
                                                if (_page3.currentState
                                                    .validate()) {
                                                  _page3.currentState.save();
                                                  _pageContinue = 3;
                                                }
                                              });
                                            },
                                            child: continueButton()),
                                      ),
                                    ],
                                  ),
                                )
                              : _pageContinue == 3
                                  ? Form(
                                      autovalidate: true,
                                      key: _page4,
                                      child: Column(
                                        children: <Widget>[
                                          showGenderInput(),
                                          showAgeInput(),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 250),
                                            child: FlatButton(
                                                onPressed: () {
                                                  setState(() {
                                                    if (_page4.currentState
                                                        .validate()) {
                                                      _page4.currentState
                                                          .save();
                                                      _pageContinue = 4;
                                                    }
                                                  });
                                                },
                                                child: continueButton()),
                                          ),
                                        ],
                                      ),
                                    )
                                  : _pageContinue == 4
                                      ? Form(
                                          autovalidate: true,
                                          key: _page5,
                                          child: Column(
                                            children: <Widget>[
                                              showDivisionInput(),
                                              showDivisionInput(),
                                              Center(
                                                child: InkWell(
                                                  child: Container(
                                                    width: 300,
                                                    height: 50,
                                                    child: Center(
                                                      child: Text(
                                                        'Add More Division',
                                                        style: TextStyle(
                                                          color: lighterGray,
                                                          fontSize: 15,
                                                          fontFamily:
                                                              'Montserrat',
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),
                                                    decoration: BoxDecoration(
                                                        color: white,
                                                        border: Border.all(
                                                            color:
                                                                lighterGray)),
                                                  ),
                                                  onTap: () {},
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 250),
                                                child: FlatButton(
                                                    onPressed: () {
                                                      setState(() {
                                                        if (_page5.currentState
                                                            .validate()) {
                                                          _page5.currentState
                                                              .save();
                                                          isNonProfit
                                                              ? _pageContinue =
                                                                  5
                                                              : _pageContinue =
                                                                  6;
                                                        }
                                                      });
                                                    },
                                                    child: continueButton()),
                                              ),
                                            ],
                                          ),
                                        )
                                      : _pageContinue == 5
                                          ? Form(
                                              autovalidate: true,
                                              key: _page6,
                                              child: Column(
                                                children: <Widget>[
                                                  showAccountInput(),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 250),
                                                    child: FlatButton(
                                                        onPressed: () {
                                                          //orgAddBenefits(context, isNonProfit);
                                                          setState(() {
                                                            if (_page6
                                                                .currentState
                                                                .validate()) {
                                                              _page6
                                                                  .currentState
                                                                  .save();
                                                              _pageContinue = 7;
                                                            }
                                                          });
                                                        },
                                                        child:
                                                            continueButton()),
                                                  ),
                                                ],
                                              ),
                                            )
                                          : _pageContinue == 6
                                              ? Form(
                                                  autovalidate: true,
                                                  key: _page7,
                                                  child: Column(
                                                    children: <Widget>[
                                                      showPackageNameInput(),
                                                      showPackagePriceInput(),
                                                      showPackageDescInput(),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal:
                                                                    22.0),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .end,
                                                          children: <Widget>[
                                                            InkWell(
                                                                onTap: () {
                                                                  setState(() {
                                                                    if (_page7
                                                                        .currentState
                                                                        .validate()) {
                                                                      _page7
                                                                          .currentState
                                                                          .save();
                                                                      _pageContinue =
                                                                          7;
                                                                    }
                                                                  });
                                                                },
                                                                child:
                                                                    addButton(
                                                                        2)),
                                                            SizedBox(
                                                                width: 20.0),
                                                            InkWell(
                                                                onTap: () {
                                                                  setState(() {
                                                                    if (_page7
                                                                        .currentState
                                                                        .validate()) {
                                                                      _page7
                                                                          .currentState
                                                                          .save();
                                                                      _pageContinue =
                                                                          7;
                                                                    }
                                                                  });
                                                                },
                                                                child:
                                                                    continueButton()),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              : _pageContinue == 7
                                                  ? Column(
                                                      children: <Widget>[
                                                        showUploadBanner(),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 250),
                                                          child: FlatButton(
                                                              onPressed: () {
                                                                setState(() {
                                                                  _pageContinue =
                                                                      8;
                                                                });
                                                              },
                                                              child:
                                                                  continueButton()),
                                                        ),
                                                      ],
                                                    )
                                                  : Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: <Widget>[
                                                        SizedBox(height: 20),
                                                        Icon(
                                                          Icons.check_circle,
                                                          color: Colors.green,
                                                          size: 70,
                                                        ),
                                                        SizedBox(height: 20),
                                                        Text(
                                                          'Event submitted successfully',
                                                          style: TextStyle(
                                                            color:
                                                                darkBackgroundColor,
                                                            fontSize: 15,
                                                            fontFamily:
                                                                'Montserrat',
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                        Text(
                                                          'Please wait for event approval',
                                                          style: TextStyle(
                                                            color:
                                                                darkBackgroundColor,
                                                            fontSize: 15,
                                                            fontFamily:
                                                                'Montserrat',
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                        SizedBox(height: 20),
                                                        FlatButton(
                                                          onPressed: () {
                                                            // print(_eventName);
                                                            // print(_eventDate);
                                                            // print(_eventLocation);
                                                            // print(
                                                            //     _eventDescription);
                                                            // print(_eventBenefits);
                                                            // print(_eventGenderReq);
                                                            // print(_eventAgeMinReq);
                                                            // print(_eventAgeMaxReq);
                                                            print(
                                                                _eventDivisionName);
                                                            print(
                                                                _eventDivisionMax);
                                                            // print(_eventAccountNum);
                                                            // print(
                                                            //     _eventPackageName);
                                                            // print(
                                                            //     _eventPackageDesc);
                                                            // print(
                                                            //     _eventPackagePrice);
                                                            // print(
                                                            //     _eventBannerURL);

                                                            if (maleVal &&
                                                                femaleVal) {
                                                              _eventGenderReq =
                                                                  "Male / Female";
                                                            } else if (maleVal &&
                                                                femaleVal ==
                                                                    false) {
                                                              _eventGenderReq =
                                                                  "Male Only";
                                                            } else if (maleVal ==
                                                                    false &&
                                                                femaleVal) {
                                                              _eventGenderReq =
                                                                  "Female Only";
                                                            } else {
                                                              _eventGenderReq =
                                                                  "Male / Female";
                                                            }
                                                            List
                                                                _eventDivision =
                                                                [];
                                                            for (var i = 0;
                                                                i <
                                                                    _eventDivisionName
                                                                        .length;
                                                                i++) {
                                                              Map map = {
                                                                'divisionName':
                                                                    _eventDivisionName[
                                                                        i],
                                                                'divisionCapacity':
                                                                    int.parse(
                                                                        _eventDivisionMax[
                                                                            i])
                                                              };
                                                              _eventDivision
                                                                  .add(map);
                                                            }

                                                            List _eventSponsor =
                                                                [];
                                                            for (var i = 0;
                                                                i <
                                                                    _eventPackageName
                                                                        .length;
                                                                i++) {
                                                              Map map = {
                                                                'packageName':
                                                                    _eventPackageName[
                                                                        i],
                                                                'packagePrice':
                                                                    int.parse(
                                                                        _eventPackagePrice[
                                                                            i]),
                                                                'packageDetails':
                                                                    _eventPackageDesc[
                                                                        i]
                                                              };
                                                              _eventSponsor
                                                                  .add(map);
                                                            }

                                                            print(
                                                                _eventSponsor);
                                                            print(
                                                                _eventNonProfit);

                                                            if (_eventNonProfit) {
                                                              _addEvent(
                                                                  eventName:
                                                                      _eventName,
                                                                  eventDate:
                                                                      _eventDate,
                                                                  eventLocation:
                                                                      _eventLocation,
                                                                  eventDescription:
                                                                      _eventDescription,
                                                                  eventBenefits:
                                                                      _eventBenefits,
                                                                  eventGenderReq:
                                                                      _eventGenderReq,
                                                                  eventAgeMinReq:
                                                                      _eventAgeMinReq,
                                                                  eventAgeMaxReq:
                                                                      _eventAgeMaxReq,
                                                                  eventDivision:
                                                                      _eventDivision,
                                                                  eventOrganizer:
                                                                      _eventOrganizerID,
                                                                  eventTime:
                                                                      _eventTime,
                                                                  eventBanner:
                                                                      _eventBannerURL,
                                                                  eventNonProfit:
                                                                      _eventNonProfit);
                                                            } else {
                                                              _addEvent(
                                                                eventName:
                                                                    _eventName,
                                                                eventDate:
                                                                    _eventDate,
                                                                eventLocation:
                                                                    _eventLocation,
                                                                eventDescription:
                                                                    _eventDescription,
                                                                eventBenefits:
                                                                    _eventBenefits,
                                                                eventGenderReq:
                                                                    _eventGenderReq,
                                                                eventAgeMinReq:
                                                                    _eventAgeMinReq,
                                                                eventAgeMaxReq:
                                                                    _eventAgeMaxReq,
                                                                eventDivision:
                                                                    _eventDivision,
                                                                eventOrganizer:
                                                                    _eventOrganizerID,
                                                                eventTime:
                                                                    _eventTime,
                                                                eventBanner:
                                                                    _eventBannerURL,
                                                                eventNonProfit:
                                                                    _eventNonProfit,
                                                                eventSponsor:
                                                                    _eventSponsor,
                                                              );
                                                            }

                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: Container(
                                                            height: 35,
                                                            width: 100,
                                                            child: Center(
                                                              child: Text(
                                                                'Finish',
                                                                style:
                                                                    TextStyle(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  fontSize: 12,
                                                                  color: white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                              ),
                                                            ),
                                                            decoration:
                                                                BoxDecoration(
                                                              gradient:
                                                                  LinearGradient(
                                                                      colors: [
                                                                    gradientLighterOrange,
                                                                    gradientDarkerOrange
                                                                  ]),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
