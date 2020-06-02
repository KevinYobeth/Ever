import 'package:flutter/material.dart';
import 'package:Ever/template/colors.dart';
import 'package:intl/intl.dart';

class eventCardMin extends StatelessWidget {
  final String eventThumb;
  final String eventDate;

  const eventCardMin({this.eventThumb, this.eventDate});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 10.0, top: 20.0),
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
                    color: white,
                    fontSize: 40,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  DateFormat('MMM').format(DateTime.parse(eventDate)),
                  style: TextStyle(
                    color: white,
                    fontSize: 20,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 280,
            height: 144,
            decoration: BoxDecoration(
              color: Colors.blueGrey[100],
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage(eventThumb),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
