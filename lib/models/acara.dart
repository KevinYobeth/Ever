import 'package:firebase_database/firebase_database.dart';

class Acara {
  String key;
  int eventID;
  String eventName;
  String eventThumb;
  bool isNonProfit;

  Acara(this.eventID, this.eventName, this.eventThumb, this.isNonProfit);

  Acara.fromSnapshot(DataSnapshot snapshot)
      : key = snapshot.key,
        eventID = snapshot.value["eventID"],
        eventName = snapshot.value["eventName"],
        eventThumb = snapshot.value["eventThumb"],
        isNonProfit = snapshot.value["isNonProfit"];

  toJson() {
    return {
      "eventID": eventID,
      "eventName": eventName,
      "eventThumb": eventThumb,
      "isNonProfit": isNonProfit,
    };
  }
}
