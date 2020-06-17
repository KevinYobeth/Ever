import 'package:Ever/models/user.dart';
import 'package:Ever/pages/home_page.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'colors.dart';

class orgProfile extends StatefulWidget {
  final User userData;

  const orgProfile({Key key, this.userData}) : super(key: key);

  @override
  _orgProfileState createState() => _orgProfileState(userData);
}

class _orgProfileState extends State<orgProfile> {
  final User userData;

  _orgProfileState(this.userData);

  final FirebaseDatabase db = FirebaseDatabase.instance;
  final _formKey = new GlobalKey<FormState>();

  Widget showOrgNameInput() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 8.0),
      child: new TextFormField(
          initialValue: userData.userOrganization,
          maxLines: 1,
          keyboardType: TextInputType.emailAddress,
          autofocus: false,
          decoration: new InputDecoration(
            fillColor: white,
            filled: true,
            hintText: 'Organization Name',
            prefixIcon: Icon(Icons.business),
          ),
          validator: (value) {
            if (value.length > 20)
              return 'Max character (20) limit';
            else
              return null;
          },
          onSaved: (value) {
            userData.userOrganization = value;
            db.reference().child('user/$userID/organizationID').set(value);
          }),
    );
  }

  Widget showOrgNumberInput() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 8.0),
      child: new TextFormField(
          initialValue: userData.userOrganizationNumber,
          maxLines: 1,
          keyboardType: TextInputType.emailAddress,
          autofocus: false,
          decoration: new InputDecoration(
            fillColor: white,
            filled: true,
            hintText: 'Organization Bank Account Number',
            prefixIcon: Icon(Icons.account_balance),
          ),
          validator: (value) {
            Pattern pattern = r'^\+?\d+$';
            RegExp regex = RegExp(pattern);
            if (!regex.hasMatch(value))
              return 'Bank Account Number must be a number';
            else
              return null;
          },
          onSaved: (value) {
            userData.userOrganizationNumber = value;
            db.reference().child('user/$userID/organizationNumber').set(value);
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    print(userData.userOrganization);
    print(userData.userOrganizationNumber);
    return Container(
      child: FractionallySizedBox(
        heightFactor: (MediaQuery.of(context).size.height - 120) /
            MediaQuery.of(context).size.height,
        alignment: Alignment.bottomCenter,
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
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Column(
                  children: <Widget>[
                    GestureDetector(
                      child: Center(
                        child: CircleAvatar(
                          radius: 75,
                          backgroundColor: lighterGray,
                          backgroundImage: NetworkImage(userData
                                      .userProfileImg ==
                                  'null'
                              ? 'https://firebasestorage.googleapis.com/v0/b/ever-a01f1.appspot.com/o/ProfileImg%2FDefaultProfile.jpg?alt=media&token=77cc3836-1483-46bf-9230-cf290f9395fb'
                              : userData.userProfileImg),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Text(
                        'Edit Profile',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 20,
                          color: white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 230),
                child: DraggableScrollableSheet(
                  initialChildSize: 0.95,
                  minChildSize: 0.5,
                  builder: (BuildContext context,
                      ScrollController scrollController) {
                    return SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Form(
                            key: _formKey,
                            child: Column(
                              children: <Widget>[
                                showOrgNameInput(),
                                showOrgNumberInput(),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(right: 30.0, top: 10.0),
                            child: InkWell(
                              child: Container(
                                height: 35,
                                width: 100,
                                child: Center(
                                  child: Text(
                                    'Save',
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
                              onTap: () {
                                if (_formKey.currentState.validate()) {
                                  _formKey.currentState.save();
                                }
                              },
                            ),
                          ),
                          SizedBox(height: 100.0),
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'Login into personal account? ',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 15,
                                    color: white,
                                  ),
                                ),
                                InkWell(
                                  child: Text(
                                    'Click Here',
                                    style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 15,
                                      color: orange,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.of(context)
                                        .popUntil((route) => route.isFirst);
                                  },
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
