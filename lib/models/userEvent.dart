import 'package:firebase_database/firebase_database.dart';

class UserEvent {
  String key;
  String eventDate;
  String eventName;
  String eventThumb;
  String userDivision;
  String userShirtSize;
  String volunteerDate;

  UserEvent(
      {this.eventDate,
      this.eventName,
      this.eventThumb,
      this.userDivision,
      this.userShirtSize,
      this.volunteerDate});

  UserEvent.fromSnapshot(DataSnapshot snapshot)
      : key = snapshot.key,
        eventDate = snapshot.value["eventDate"],
        eventName = snapshot.value["eventName"],
        eventThumb = snapshot.value["eventThumb"],
        userDivision = snapshot.value["userDivision"],
        userShirtSize = snapshot.value["userShirtSize"],
        volunteerDate = snapshot.value["volunteerDate"];

  toJson() {
    return {
      "eventDate": eventDate,
      "eventName": eventName,
      "eventThumb": eventThumb,
      "userDivision": userDivision,
      "userShirtSize": userShirtSize,
      "volunteerDate": volunteerDate
    };
  }
}
