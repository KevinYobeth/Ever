import 'dart:io';

import 'package:Ever/models/user.dart';
import 'package:Ever/pages/home_page.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:Ever/template/colors.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

File _image;
bool _uploaded = false;
String _downloadURL;
String user = userID;

Future getImage(bool isCamera) async {
  File image;
  if (isCamera) {
    image = await ImagePicker.pickImage(source: ImageSource.camera);
  } else {
    image = await ImagePicker.pickImage(source: ImageSource.gallery);
  }
  _image = image;
}

Future uploadImage(User userData) async {
  FirebaseDatabase _dbRef = FirebaseDatabase.instance;
  StorageReference _reference =
      FirebaseStorage.instance.ref().child('/ProfileImg/$user');
  StorageUploadTask uploadTask = _reference.putFile(_image);
  StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
  _uploaded = true;
  String downloadAddress = await _reference.getDownloadURL();
  _downloadURL = downloadAddress;
  db.reference().child('user/$user').child('userProfileImg').set(_downloadURL);
  userData.userProfileImg = _downloadURL;
  print(_downloadURL);
}

void profileBottomSheet(context, User userData) {
  print(user);
  showBottomSheet(
    context: context,
    elevation: 0,
    builder: (BuildContext bc) {
      return FractionallySizedBox(
        heightFactor: (MediaQuery.of(context).size.height - 120) /
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
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      GestureDetector(
                        child: Container(
                          height: 150,
                          width: 150,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: lighterGray,
                            image: DecorationImage(
                                image: NetworkImage(userData.userProfileImg ==
                                        'null'
                                    ? 'https://firebasestorage.googleapis.com/v0/b/ever-a01f1.appspot.com/o/ProfileImg%2FDefaultProfile.jpg?alt=media&token=77cc3836-1483-46bf-9230-cf290f9395fb'
                                    : userData.userProfileImg),
                                fit: BoxFit.cover),
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
                      FlatButton(
                        child: Container(
                          height: 30,
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
                              color: orange,
                              borderRadius: BorderRadius.circular(20)),
                        ),
                      ),
                    ],
                  ),
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
                      child: Padding(
                        padding: const EdgeInsets.all(20),
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
                              height: 20,
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
                              height: 20,
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
      );
    },
  );
}
