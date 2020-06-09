import 'dart:async';
import 'dart:io';

import 'package:Ever/models/user.dart';
import 'package:Ever/models/userEvent.dart';
import 'package:Ever/pages/home_page.dart';
import 'package:Ever/pages/orgHomePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:Ever/template/colors.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:Ever/template/profileEventCard.dart';

File _image;
bool _uploaded = false;
String downloadURL;
String user;

String _userName;
String _userEmail;
String _userCurPass;
String _userPass;
String _userPhone;

int _editProfile = 0;

FirebaseDatabase _dbRef = FirebaseDatabase.instance;
final _formKey = new GlobalKey<FormState>();
final _upgradeFormKey = new GlobalKey<FormState>();

class userProfile extends StatefulWidget {
  final User userData;
  final Function() signOut;
  final Function() notifyParent;

  userProfile({this.userData, this.signOut, this.notifyParent});

  @override
  _userProfileState createState() => _userProfileState(userData, signOut);
}

class _userProfileState extends State<userProfile> {
  final User userData;
  final Function signOut;

  List<UserEvent> _userEvents;

  Query _userEventsQuery;

  StreamSubscription<Event> _onEventsAddedSubscription;

  onEventAdded(Event userEvents) {
    setState(() {
      _userEvents.add(UserEvent.fromSnapshot(userEvents.snapshot));
    });
  }

  _userProfileState(this.userData, this.signOut);

  @override
  void initState() {

    _userEvents = new List();
    _userEventsQuery = db
        .reference()
        .child("user/$userID/userEvent")
        .orderByChild("eventDate");

    _onEventsAddedSubscription =
        _userEventsQuery.onChildAdded.listen(onEventAdded);

    _editProfile = 0;
  }

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

  Future uploadImage(User userData) async {
    StorageReference _reference =
        FirebaseStorage.instance.ref().child('/ProfileImg/$user');
    StorageUploadTask uploadTask = _reference.putFile(_image);
    StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
    _uploaded = true;
    String downloadAddress = await _reference.getDownloadURL();
    downloadURL = downloadAddress;
    db.reference().child('user/$user').child('userProfileImg').set(downloadURL);
    setState(() {
      userData.userProfileImg = downloadURL;
      widget.notifyParent();
    });
    print(downloadURL);
  }

  Widget showUsernameInput() {
    return Padding(
      padding: EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 8.0),
      child: new TextFormField(
          maxLines: 1,
          initialValue: userData.userName,
          obscureText: false,
          autofocus: false,
          decoration: new InputDecoration(
            filled: true,
            fillColor: white,
            hintText: 'Full Name',
            prefixIcon: Icon(Icons.account_circle),
          ),
          validator: (value) {
            if (value.length < 4)
              return 'Username must contain more than 8 letters.';
            else
              return null;
          },
          onSaved: (value) {
            _userName = value.trim();
            db.reference().child('user/$user/userName').set(value);
          }),
    );
  }

  Widget showEmailInput() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 8.0),
      child: new TextFormField(
          maxLines: 1,
          initialValue: userData.userEmail,
          keyboardType: TextInputType.emailAddress,
          autofocus: false,
          decoration: new InputDecoration(
            fillColor: white,
            filled: true,
            hintText: 'Email',
            prefixIcon: Icon(Icons.email),
          ),
          validator: (value) {
            Pattern pattern =
                r'^((?!\.)[\w-_.]*[^.])(@\w+)(\.\w+(\.\w+)?[^.\W])$';
            RegExp regex = RegExp(pattern);
            if (!regex.hasMatch(value))
              return 'Invalid email address';
            else
              return null;
          },
          onSaved: (value) {
            userData.userEmail = value.trim();
            db.reference().child('user/$user/userEmail').set(value);
          }),
    );
  }

  void _changePassword(String password) async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    FirebaseUser user = await FirebaseAuth.instance.currentUser();

    await _auth
        .signInWithEmailAndPassword(
            email: userData.userEmail, password: _userCurPass)
        .then((value) {
      user.updatePassword(password).then((_) {
        print("Succesfull changed password");
      }).catchError((error) {
        print("Password can't be changed" + error.toString());
      });
    });
  }

  Widget showCurrentPasswordInput() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 8.0),
      child: new TextFormField(
          maxLines: 1,
          obscureText: true,
          autofocus: false,
          decoration: new InputDecoration(
              fillColor: white,
              filled: true,
              hintText: 'Current Password',
              prefixIcon: Icon(Icons.lock)),
          validator: (value) {
            Pattern pattern =
                r'^(?=.*[0-9]+.*)(?=.*[a-zA-Z]+.*)[0-9a-zA-Z]{8,}$';
            RegExp regex = new RegExp(pattern);
            if (!regex.hasMatch(value))
              return 'Password must contain at least 1 letter and 1 number.';
            else
              return null;
          },
          onSaved: (value) {
            _userCurPass = value.trim();
          }),
    );
  }

  Widget showPasswordInput() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 8.0),
      child: new TextFormField(
          maxLines: 1,
          obscureText: true,
          autofocus: false,
          decoration: new InputDecoration(
              fillColor: white,
              filled: true,
              hintText: 'Password',
              prefixIcon: Icon(Icons.lock)),
          validator: (value) {
            Pattern pattern =
                r'^(?=.*[0-9]+.*)(?=.*[a-zA-Z]+.*)[0-9a-zA-Z]{8,}$';
            RegExp regex = new RegExp(pattern);
            if (!regex.hasMatch(value))
              return 'Password must contain at least 1 letter and 1 number.';
            else
              return null;
          },
          onSaved: (value) {
            _userPass = value.trim();
            _changePassword(_userPass);
          }),
    );
  }

  Widget showPhoneNumberInput() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 8.0),
      child: new TextFormField(
          maxLines: 1,
          initialValue: userData.userPhone,
          obscureText: false,
          autofocus: false,
          decoration: new InputDecoration(
            filled: true,
            fillColor: white,
            hintText: 'Phone Number',
            prefixIcon: Icon(Icons.phone),
          ),
          validator: (value) {
            Pattern pattern = r'^[+62][0-9]{10,15}$';
            RegExp regex = new RegExp(pattern);
            if (!regex.hasMatch(value))
              return 'Phone number must start with +62';
            else
              return null;
          },
          onSaved: (value) {
            _userPhone = value.trim();
            db.reference().child('user/$user/userPhone').set(_userPhone);
          }),
    );
  }

  Widget showOrgNameInput() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 8.0),
      child: new TextFormField(
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
            //userData.userEmail = value.trim();
            db.reference().child('user/$user/organizationID').set(value);
          }),
    );
  }

  Widget showOrgNumberInput() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 8.0),
      child: new TextFormField(
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
            //userData.userEmail = value.trim();
            db.reference().child('user/$user/organizationNumber').set(value);
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
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
                      onTap: () {
                        getImage(false).then((value) {
                          uploadImage(userData);
                        });
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    if (_editProfile == 0)
                      FlatButton(
                        child: Container(
                          height: 35,
                          width: 100,
                          child: Center(
                            child: Text(
                              'Edit Profile',
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
                        onPressed: () {
                          setState(() {
                            _editProfile = 1;
                          });
                        },
                      )
                    else if (_editProfile == 1)
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
                    else if (_editProfile == 2)
                      Container(
                        child: Text(
                          'Upgrade Account',
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
                padding: const EdgeInsets.only(top: 250),
                child: DraggableScrollableSheet(
                  initialChildSize: 0.95,
                  minChildSize: 0.5,
                  builder: (BuildContext context,
                      ScrollController scrollController) {
                    return SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: _editProfile == 0
                          ? Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'Upcoming Events',
                                    style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 20,
                                      color: white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 200,
                                    child: ListView.builder(
                                      physics: BouncingScrollPhysics(),
                                      scrollDirection: Axis.horizontal,
                                      itemCount: _userEvents.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        String eventDate =
                                            _userEvents[index].eventDate;
                                        String eventThumb =
                                            _userEvents[index].eventThumb;

                                        DateTime eDate = DateTime.parse(
                                            _userEvents[index].eventDate);

                                        if (_userEvents.length > 0 &&
                                            eDate.isAfter(DateTime.now())) {
                                          return eventCardMin(
                                            eventThumb: eventThumb,
                                            eventDate: eventDate,
                                          );
                                        } else {
                                          return Container();
                                        }
                                      },
                                    ),
                                  ),
                                  Text(
                                    'Past Events',
                                    style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 20,
                                      color: white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 200,
                                    child: ListView.builder(
                                      physics: BouncingScrollPhysics(),
                                      scrollDirection: Axis.horizontal,
                                      itemCount: _userEvents.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        String eventDate =
                                            _userEvents[index].eventDate;
                                        String eventThumb =
                                            _userEvents[index].eventThumb;
                                        DateTime eDate = DateTime.parse(
                                            _userEvents[index].eventDate);

                                        if (_userEvents.length > 0 &&
                                            eDate.isBefore(DateTime.now())) {
                                          return eventCardMin(
                                            eventThumb: eventThumb,
                                            eventDate: eventDate,
                                          );
                                        } else {
                                          return Container();
                                        }
                                      },
                                    ),
                                  ),
                                  Text(
                                    'Notifications',
                                    style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 20,
                                      color: white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'Notifications is empty',
                                    style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 15,
                                      color: lighterGray,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 100.0),
                                  Center(
                                    child: InkWell(
                                      child: Text(
                                        'Log Out',
                                        style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontSize: 15,
                                          color: orange,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      onTap: () {
                                        signOut();
                                      },
                                    ),
                                  )
                                ],
                              ),
                            )
                          : _editProfile == 1
                              ? Container(
                                  child: Column(
                                    children: <Widget>[
                                      Form(
                                        key: _formKey,
                                        child: Column(
                                          children: <Widget>[
                                            showUsernameInput(),
                                            showEmailInput(),
                                            showCurrentPasswordInput(),
                                            showPasswordInput(),
                                            showPhoneNumberInput(),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            right: 28.0, top: 5.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: <Widget>[
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(right: 15),
                                              child: InkWell(
                                                child: Container(
                                                  height: 35,
                                                  width: 100,
                                                  child: Center(
                                                    child: Text(
                                                      'Return',
                                                      style: TextStyle(
                                                        fontFamily:
                                                            'Montserrat',
                                                        fontSize: 12,
                                                        color: white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                  decoration: BoxDecoration(
                                                      color: Colors.grey[800],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20)),
                                                ),
                                                onTap: () {
                                                  setState(() {
                                                    _editProfile = 0;
                                                  });
                                                },
                                              ),
                                            ),
                                            InkWell(
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
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                                decoration: BoxDecoration(
                                                    gradient: LinearGradient(
                                                        colors: [
                                                          gradientLighterOrange,
                                                          gradientDarkerOrange
                                                        ]),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20)),
                                              ),
                                              onTap: () {
                                                setState(() {
                                                  if (_formKey.currentState
                                                      .validate()) {
                                                    _formKey.currentState
                                                        .save();
                                                    print('Saved');
                                                  }
                                                });
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 20.0),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            !userData.isVerified
                                                ? 'Want to host an event? '
                                                : 'Login into Org. account? ',
                                            style: TextStyle(
                                                color: white,
                                                fontFamily: 'Montserrat',
                                                fontSize: 12),
                                          ),
                                          InkWell(
                                            child: Text(
                                              !userData.isVerified
                                                  ? 'Upgrade Here'
                                                  : 'Click Here',
                                              style: TextStyle(
                                                  color: orange,
                                                  fontFamily: 'Montserrat',
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            onTap: () {
                                              setState(() {
                                                if (!userData.isVerified)
                                                  _editProfile = 2;
                                                else
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              orgHomePage(
                                                                userData:
                                                                    userData,
                                                              )));
                                              });
                                            },
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 20.0),
                                    ],
                                  ),
                                )
                              : Container(
                                  child: Column(
                                    children: <Widget>[
                                      Form(
                                        key: _upgradeFormKey,
                                        child: Column(
                                          children: <Widget>[
                                            showOrgNameInput(),
                                            showOrgNumberInput(),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            right: 28.0, top: 5.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: <Widget>[
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(right: 15),
                                              child: InkWell(
                                                child: Container(
                                                  height: 35,
                                                  width: 100,
                                                  child: Center(
                                                    child: Text(
                                                      'Return',
                                                      style: TextStyle(
                                                        fontFamily:
                                                            'Montserrat',
                                                        fontSize: 12,
                                                        color: white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                  decoration: BoxDecoration(
                                                      color: Colors.grey[800],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20)),
                                                ),
                                                onTap: () {
                                                  setState(() {
                                                    _editProfile = 0;
                                                  });
                                                },
                                              ),
                                            ),
                                            InkWell(
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
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                                decoration: BoxDecoration(
                                                    gradient: LinearGradient(
                                                        colors: [
                                                          gradientLighterOrange,
                                                          gradientDarkerOrange
                                                        ]),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20)),
                                              ),
                                              onTap: () {
                                                setState(() {
                                                  if (_upgradeFormKey
                                                      .currentState
                                                      .validate()) {
                                                    _upgradeFormKey.currentState
                                                        .save();
                                                    db
                                                        .reference()
                                                        .child(
                                                            'user/$user/isVerified')
                                                        .set(true);
                                                    print('Saved');
                                                  }
                                                });
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 20.0),
                                    ],
                                  ),
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
