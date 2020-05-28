import 'package:flutter/material.dart';
import 'package:Ever/template/colors.dart';

Widget showEventnameInput() {
  return Padding(
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
  );
}

Widget showEventDateInput() {
  return Padding(
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
  );
}

Widget showEventLocationInput() {
  return Padding(
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
  );
}

Widget showDescriptionInput() {
  return Padding(
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
  );
}

Widget showBenefitsInput() {
  return Padding(
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
  );
}

int _radioValue = 0;

Widget showGenderInput() {
  return Padding(
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
  return Padding(
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
  );
}

Widget showAccountInput() {
  return Padding(
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
  );
}

Widget showPackageNameInput() {
  return Padding(
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
  );
}

Widget showPackagePriceInput() {
  return Padding(
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
  );
}

Widget showPackageDescInput() {
  return Padding(
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

void orgAddEventDetail(context) {
  showBottomSheet(
      context: context,
      builder: (BuildContext bc) {
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
                    builder: (BuildContext context,
                        ScrollController scrollController) {
                      return SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: Column(
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                children: <Widget>[
                                  FlatButton(
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
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                    ),
                                    onPressed: () {
                                      orgCreateEvent(context, true);
                                    },
                                  ),
                                  FlatButton(
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
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                    ),
                                    onPressed: () {
                                      orgCreateEvent(context, false);
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      });
}

void orgCreateEvent(context, bool isNonProfit) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext bc) {
      return Container(
        child: FractionallySizedBox(
          heightFactor: (MediaQuery.of(context).size.height + 250) /
              MediaQuery.of(context).size.height,
          child: Container(
            height: 1500,
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
                  builder: (BuildContext context,
                      ScrollController scrollController) {
                    return SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
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
                            showEventnameInput(),
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
                            showEventDateInput(),
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
                            showEventLocationInput(),
                            Padding(
                              padding: const EdgeInsets.only(left: 250),
                              child: FlatButton(
                                child: continueButton(),
                                onPressed: () {
                                  orgAddDescription(context, isNonProfit);
                                },
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
          ),
        ),
      );
    },
  );
}

void orgAddDescription(context, bool isNonProfit) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext bc) {
      return Container(
        child: FractionallySizedBox(
          heightFactor: (MediaQuery.of(context).size.height + 250) /
              MediaQuery.of(context).size.height,
          child: Container(
            height: 1500,
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
                  builder: (BuildContext context,
                      ScrollController scrollController) {
                    return SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
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
                            showDescriptionInput(),
                            Padding(
                              padding: const EdgeInsets.only(left: 250),
                              child: FlatButton(
                                  onPressed: () {
                                    orgAddBenefits(context, isNonProfit);
                                  },
                                  child: continueButton()),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

void orgAddBenefits(context, bool isNonProfit) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext bc) {
      return Container(
        child: FractionallySizedBox(
          heightFactor: (MediaQuery.of(context).size.height + 250) /
              MediaQuery.of(context).size.height,
          child: Container(
            height: 1500,
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
                  builder: (BuildContext context,
                      ScrollController scrollController) {
                    return SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
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
                            showBenefitsInput(),
                            Padding(
                              padding: const EdgeInsets.only(left: 250),
                              child: FlatButton(
                                  onPressed: () {
                                    orgAddCriteria(context, isNonProfit);
                                  },
                                  child: continueButton()),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

void orgAddCriteria(context, bool isNonProfit) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext bc) {
      return Container(
        child: FractionallySizedBox(
          heightFactor: (MediaQuery.of(context).size.height + 250) /
              MediaQuery.of(context).size.height,
          child: Container(
            height: 1500,
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
                  builder: (BuildContext context,
                      ScrollController scrollController) {
                    return SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
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
                            showGenderInput(),
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
                            Padding(
                              padding: const EdgeInsets.only(left: 250),
                              child: FlatButton(
                                  onPressed: () {
                                    orgAddDivision(context, isNonProfit);
                                  },
                                  child: continueButton()),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

void orgAddDivision(context, bool isNonProfit) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext bc) {
      return Container(
        child: FractionallySizedBox(
          heightFactor: (MediaQuery.of(context).size.height + 250) /
              MediaQuery.of(context).size.height,
          child: Container(
            height: 1500,
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
                  builder: (BuildContext context,
                      ScrollController scrollController) {
                    return SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
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
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                      color: white,
                                      border: Border.all(color: lighterGray)),
                                ),
                                onPressed: () {},
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 250),
                              child: FlatButton(
                                  onPressed: () {
                                    isNonProfit
                                        ? orgAddAccount(context)
                                        : orgAddSponsorPackage(context);
                                  },
                                  child: continueButton()),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

void orgAddAccount(context) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext bc) {
      return Container(
        child: FractionallySizedBox(
          heightFactor: (MediaQuery.of(context).size.height + 250) /
              MediaQuery.of(context).size.height,
          child: Container(
            height: 1500,
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
                  builder: (BuildContext context,
                      ScrollController scrollController) {
                    return SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
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
                            showAccountInput(),
                            Padding(
                              padding: const EdgeInsets.only(left: 250),
                              child: FlatButton(
                                  onPressed: () {
                                    orgFinishCreate(context);
                                  },
                                  child: continueButton()),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

void orgAddSponsorPackage(context) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext bc) {
      return Container(
        child: FractionallySizedBox(
          heightFactor: (MediaQuery.of(context).size.height + 250) /
              MediaQuery.of(context).size.height,
          child: Container(
            height: 1500,
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
                  builder: (BuildContext context,
                      ScrollController scrollController) {
                    return SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
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
                            showPackageNameInput(),
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
                            showPackagePriceInput(),
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
                            showPackageDescInput(),
                            Padding(
                              padding: const EdgeInsets.only(left: 250),
                              child: FlatButton(
                                  onPressed: () {
                                    orgFinishCreate(context);
                                  },
                                  child: continueButton()),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

void orgFinishCreate(context) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext bc) {
      return Container(
        child: FractionallySizedBox(
          heightFactor: (MediaQuery.of(context).size.height + 250) /
              MediaQuery.of(context).size.height,
          child: Container(
            height: 1500,
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
                  builder: (BuildContext context,
                      ScrollController scrollController) {
                    return SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
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
                                color: darkBackgroundColor,
                                fontSize: 15,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Please wait for event approval',
                              style: TextStyle(
                                color: darkBackgroundColor,
                                fontSize: 15,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 20),
                            FlatButton(
                              onPressed: () {
                                Navigator.pop(context);
                                Navigator.pop(context);
                                Navigator.pop(context);
                                Navigator.pop(context);
                                Navigator.pop(context);
                                Navigator.pop(context);
                                Navigator.pop(context);
                              },
                              child: Container(
                                height: 35,
                                width: 100,
                                child: Center(
                                  child: Text(
                                    'Finish',
                                    style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 12,
                                      color: white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(colors: [
                                      gradientLighterOrange,
                                      gradientDarkerOrange
                                    ]),
                                    borderRadius: BorderRadius.circular(20)),
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
          ),
        ),
      );
    },
  );
}
