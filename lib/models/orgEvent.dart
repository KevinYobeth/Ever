import 'package:firebase_database/firebase_database.dart';

class OrgEvent {
  String key;
  String eventDate;
  String eventName;
  String eventThumb;

  OrgEvent({this.eventName, this.eventDate, this.eventThumb});

  OrgEvent.fromSnapshot(DataSnapshot snapshot)
      : key = snapshot.key,
        eventName = snapshot.value["eventName"],
        eventDate = snapshot.value["eventDate"],
        eventThumb = snapshot.value["eventThumb"];

  toJson() {
    return {
      "eventName": eventName,
      "eventDate": eventDate,
      "eventThumb": eventThumb
    };
  }
}
