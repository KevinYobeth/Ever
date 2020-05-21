import 'package:firebase_database/firebase_database.dart';

class User {
  String key;
  bool isVerified;
  String userOrganization;
  String userDOB;
  String userEmail;
  String userGender;
  String userIdenURL;
  String userName;
  String userPhone;
  String userProfileImg;

  User(
      {this.isVerified,
      this.userOrganization,
      this.userDOB,
      this.userEmail,
      this.userGender,
      this.userIdenURL,
      this.userName,
      this.userPhone,
      this.userProfileImg});

  User.fromSnapshot(DataSnapshot snapshot)
      : key = snapshot.key,
        isVerified = snapshot.value["isVerified"],
        userOrganization = snapshot.value["organizationName"],
        userDOB = snapshot.value["userDOB"],
        userEmail = snapshot.value["userEmail"],
        userGender = snapshot.value["userGender"],
        userIdenURL = snapshot.value["userIdenURL"],
        userName = snapshot.value["userName"],
        userPhone = snapshot.value["userPhone"],
        userProfileImg = snapshot.value["userProfileImg"];

  toJson() {
    return {
      "userOrganization": userOrganization,
      "userDOB": userDOB,
      "userEmail": userEmail,
      "userGender": userGender,
      "userIdenURL": userIdenURL,
      "userName": userName,
      "userPhone": userPhone,
      "isVerified": isVerified,
      "userProfileImg": userProfileImg,
    };
  }
}
