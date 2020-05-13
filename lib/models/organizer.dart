import 'package:firebase_database/firebase_database.dart';

class Organizer {
  String key;
  String organizationName;

  Organizer({this.organizationName});

  Organizer.fromSnapshot(DataSnapshot snapshot)
      : key = snapshot.key,
        organizationName = snapshot.value["organizationName"];

  toJson() {
    return {"eventOrganizer": organizationName};
  }
}
