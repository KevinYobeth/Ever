import 'package:flutter/material.dart';
import 'package:Ever/template/colors.dart';

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
              return 'Event name must contain more than 8 letters.';
            else
              return null;
          },
        ),
      ),
    ],
  );
}

Widget showEventDateInput() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(left: 33),
        child: Text(
          'Event Date',
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
              hintText: 'Event Date',
              icon: new Icon(
                Icons.date_range,
                color: Colors.grey,
              )),
          validator: (value) {},
        ),
      ),
    ],
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
          validator: (value) {},
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
            hintText: 'Benefits',
          ),
          validator: (value) {},
        ),
      ),
    ],
  );
}

int _radioValue = 0;

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
            Radio(
              value: 0,
              groupValue: _radioValue,
            ),
            Text('Male'),
            Radio(
              value: 1,
              groupValue: _radioValue,
            ),
            Text('Female'),
          ],
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
      showMinInput(),
      showMaxInput(),
    ],
  );
}

Widget showMinInput() {
  return Padding(
    padding: EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 8.0),
    child: new TextFormField(
      maxLines: 1,
      obscureText: false,
      autofocus: false,
      decoration: new InputDecoration(
        hintText: 'Min',
      ),
      validator: (value) {},
    ),
  );
}

Widget showMaxInput() {
  return Padding(
    padding: EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 8.0),
    child: new TextFormField(
      maxLines: 1,
      obscureText: false,
      autofocus: false,
      decoration: new InputDecoration(
        hintText: 'Max',
      ),
      validator: (value) {},
    ),
  );
}

Widget showNameInput() {
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
      Padding(
        padding: EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 8.0),
        child: new TextFormField(
          maxLines: 1,
          obscureText: false,
          autofocus: false,
          decoration: new InputDecoration(
            hintText: 'Name',
          ),
          validator: (value) {},
        ),
      ),
    ],
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
          validator: (value) {},
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
          validator: (value) {},
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
            hintText: 'Package Description',
          ),
          validator: (value) {},
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
            DraggableScrollableSheet(
              initialChildSize: 0.95,
              minChildSize: 0.5,
              builder:
                  (BuildContext context, ScrollController scrollController) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
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
                              showModalBottomSheet(
                                  context: context,
                                  barrierColor:
                                      Color.fromRGBO(255, 255, 255, 0),
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
                              showModalBottomSheet(
                                  context: context,
                                  barrierColor:
                                      Color.fromRGBO(255, 255, 255, 0),
                                  builder: (BuildContext context) {
                                    return orgCreateEvent(isNonProfit: false);
                                  });
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
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
                      ? Column(
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
                                    _pageContinue = 1;
                                  });
                                  //orgAddDescription(context, isNonProfit);
                                },
                              ),
                            ),
                          ],
                        )
                      : _pageContinue == 1
                          ? Column(
                              children: <Widget>[
                                showDescriptionInput(),
                                Padding(
                                  padding: const EdgeInsets.only(left: 250),
                                  child: FlatButton(
                                      onPressed: () {
                                        //orgAddBenefits(context, isNonProfit);
                                        setState(() {
                                          _pageContinue = 2;
                                        });
                                      },
                                      child: continueButton()),
                                ),
                              ],
                            )
                          : _pageContinue == 2
                              ? Column(
                                  children: <Widget>[
                                    showBenefitsInput(),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 250),
                                      child: FlatButton(
                                          onPressed: () {
                                            //orgAddBenefits(context, isNonProfit);
                                            setState(() {
                                              _pageContinue = 3;
                                            });
                                          },
                                          child: continueButton()),
                                    ),
                                  ],
                                )
                              : _pageContinue == 3
                                  ? Column(
                                      children: <Widget>[
                                        showGenderInput(),
                                        showAgeInput(),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 250),
                                          child: FlatButton(
                                              onPressed: () {
                                                //orgAddBenefits(context, isNonProfit);
                                                setState(() {
                                                  _pageContinue = 4;
                                                });
                                              },
                                              child: continueButton()),
                                        ),
                                      ],
                                    )
                                  : _pageContinue == 4
                                      ? Column(
                                          children: <Widget>[
                                            showNameInput(),
                                            showMaxInput(),
                                            Center(
                                              child: FlatButton(
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
                                                          color: lighterGray)),
                                                ),
                                                onPressed: () {},
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 250),
                                              child: FlatButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      isNonProfit
                                                          ? _pageContinue = 5
                                                          : _pageContinue = 6;
                                                    });
                                                  },
                                                  child: continueButton()),
                                            ),
                                          ],
                                        )
                                      : _pageContinue == 5
                                          ? Column(
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
                                                          _pageContinue = 7;
                                                        });
                                                      },
                                                      child: continueButton()),
                                                ),
                                              ],
                                            )
                                          : _pageContinue == 6
                                              ? Column(
                                                  children: <Widget>[
                                                    showPackageNameInput(),
                                                    showPackagePriceInput(),
                                                    showPackageDescInput(),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 250),
                                                      child: FlatButton(
                                                          onPressed: () {
                                                            //orgAddBenefits(context, isNonProfit);
                                                            setState(() {
                                                              _pageContinue = 7;
                                                            });
                                                          },
                                                          child:
                                                              continueButton()),
                                                    ),
                                                  ],
                                                )
                                              : Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
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
                                                        Navigator.pop(context);
                                                      },
                                                      child: Container(
                                                        height: 35,
                                                        width: 100,
                                                        child: Center(
                                                          child: Text(
                                                            'Finish',
                                                            style: TextStyle(
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
                                                        decoration: BoxDecoration(
                                                            gradient:
                                                                LinearGradient(
                                                                    colors: [
                                                                  gradientLighterOrange,
                                                                  gradientDarkerOrange
                                                                ]),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20)),
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
