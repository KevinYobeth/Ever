import 'package:firebase_database/firebase_database.dart';

class Acara {
  String key;
  int eventID;
  String eventName;
  String eventThumb;
  String eventTime;
  String eventDate;
  String eventPlace;
  String eventDesc;
  String eventCriteria;
  //String eventDivision;
  String eventBenefits;
  //String eventOrganizer;
  //String eventStart
  //String eventClose
  bool isNonProfit;

  Acara(
      this.eventID,
      this.eventName,
      this.eventThumb,
      this.eventTime,
      this.eventDate,
      this.eventPlace,
      this.eventDesc,
      this.eventCriteria,
      this.eventBenefits,
      this.isNonProfit);

  Acara.fromSnapshot(DataSnapshot snapshot)
      : key = snapshot.key,
        eventID = snapshot.value["eventID"],
        eventName = snapshot.value["eventName"],
        eventThumb = snapshot.value["eventThumb"],
        eventTime = snapshot.value["eventTime"],
        eventDate = snapshot.value["eventDate"],
        eventPlace = snapshot.value["eventPlace"],
        eventDesc = snapshot.value["eventDesc"],
        eventCriteria = snapshot.value["eventCriteria"],
        eventBenefits = snapshot.value["eventBenefits"],
        isNonProfit = snapshot.value["isNonProfit"];

  toJson() {
    return {
      "eventID": eventID,
      "eventName": eventName,
      "eventThumb": eventThumb,
      "eventTime": eventTime,
      "eventDate": eventDate,
      "eventPlace": eventPlace,
      "eventDesc": eventDesc,
      "eventCriteria": eventCriteria,
      "eventBenefits": eventBenefits,
      "isNonProfit": isNonProfit,
    };
  }
}
