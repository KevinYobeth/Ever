import 'package:Ever/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:Ever/template/colors.dart';
import 'package:Ever/template/orgAddEventDetail.dart';
import 'package:intl/intl.dart';

class addEvent extends StatefulWidget {
  final Function refresh;

  const addEvent({Key key, this.refresh}) : super(key: key);

  @override
  _addEventState createState() => _addEventState(refresh);
}

class _addEventState extends State<addEvent> {
  final Function refresh;

  _addEventState(this.refresh);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  '+',
                  style: TextStyle(
                    color: darkBackgroundColor,
                    fontSize: 40,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Add',
                  style: TextStyle(
                    color: darkBackgroundColor,
                    fontSize: 20,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          InkWell(
            child: Container(
              width: 300,
              height: 170,
              decoration: BoxDecoration(
                color: Colors.blueGrey[100],
                borderRadius: BorderRadius.circular(10),
              ),
              alignment: Alignment.center,
              child: Text(
                'Add Event',
                style: TextStyle(
                    color: darkBackgroundColor,
                    fontSize: 22,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold),
              ),
            ),
            onTap: () {
              widget.refresh();
              var eventDetailController = showBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return addEventDetail();
                  });

              eventDetailController.closed.then((value) {
                setState(() {
                  widget.refresh();
                });
              });
            },
          ),
        ],
      ),
    );
  }
}

class orgEventCard extends StatelessWidget {
  final String eventDate;
  final String eventBanner;
  final bool isAddEvent;

  const orgEventCard(
      {Key key, this.eventDate, this.eventBanner, this.isAddEvent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  DateFormat('dd').format(DateTime.parse(eventDate)),
                  style: TextStyle(
                    color: darkBackgroundColor,
                    fontSize: 40,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  DateFormat('MMM').format(DateTime.parse(eventDate)),
                  style: TextStyle(
                    color: darkBackgroundColor,
                    fontSize: 20,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 310,
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(image: NetworkImage(eventBanner)),
              color: Colors.blueGrey[100],
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ],
      ),
    );
  }
}
