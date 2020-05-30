import 'package:firebase_database/firebase_database.dart';

class Acara {
  String key;
  String eventName;
  String eventOrganizer;
  String eventThumb;
  String eventTime;
  String eventDate;
  String eventPlace;
  String eventDesc;
  String eventCriteria;
  List eventDivision;
  List eventSponsor;
  //List eventVolunteer;
  String eventBenefits;
  bool isNonProfit;

  Acara(
      {this.eventName,
      this.eventOrganizer,
      this.eventThumb,
      this.eventTime,
      this.eventDate,
      this.eventPlace,
      this.eventDesc,
      this.eventCriteria,
      this.eventDivision,
      this.eventSponsor,
      //this.eventVolunteer,
      this.eventBenefits,
      this.isNonProfit});

  Acara.fromSnapshot(DataSnapshot snapshot)
      : key = snapshot.key,
        eventName = snapshot.value["eventName"],
        eventOrganizer = snapshot.value["eventOrganizer"],
        eventThumb = snapshot.value["eventThumb"],
        eventTime = snapshot.value["eventTime"],
        eventDate = snapshot.value["eventDate"],
        eventPlace = snapshot.value["eventPlace"],
        eventDesc = snapshot.value["eventDesc"],
        eventCriteria = snapshot.value["eventCriteria"],
        eventDivision = snapshot.value["eventDivision"],
        eventSponsor = snapshot.value["eventSponsor"],
        //eventVolunteer = snapshot.value["eventVolunteer"],
        eventBenefits = snapshot.value["eventBenefits"],
        isNonProfit = snapshot.value["isNonProfit"];

  toJson() {
    return {
      "eventName": eventName,
      "eventOrganizer": eventOrganizer,
      "eventThumb": eventThumb,
      "eventTime": eventTime,
      "eventDate": eventDate,
      "eventPlace": eventPlace,
      "eventDesc": eventDesc,
      "eventCriteria": eventCriteria,
      "eventDivision": eventDivision,
      "eventSponsor": eventSponsor,
      //"eventVolunteer": eventVolunteer,
      "eventBenefits": eventBenefits,
      "isNonProfit": isNonProfit,
    };
  }
}
