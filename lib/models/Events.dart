class Events {
  int eventID;
  String eventName;
  String eventThumb;
  bool isNonProfit;

  Events({this.eventID, this.eventName, this.eventThumb, this.isNonProfit});

  Events.fromJson(Map<String, dynamic> json) {
    eventID = json['eventID'];
    eventName = json['eventName'];
    eventThumb = json['eventThumb'];
    isNonProfit = json['isNonProfit'];
  }
}
