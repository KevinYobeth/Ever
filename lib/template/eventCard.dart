import 'package:flutter/material.dart';
import 'package:Ever/template/colors.dart';

class eventCard extends StatelessWidget {
  final String eventName;
  final String category;
  eventCard({this.eventName, this.category});

  @override
  Widget build(BuildContext context) {
    //TODO Switch Column to stack
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 125, 0, 0),
                  child: Text(
                    "$eventName",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(60, 137, 0, 0),
                  child: Container(
                    child: Center(
                        child: Text(
                      "$category",
                      style: TextStyle(
                          fontSize: 10,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold),
                    )),
                    width: 70,
                    height: 20,
                    decoration: BoxDecoration(
                      color: gray,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                )
              ],
            ),
            width: 350,
            height: 180,
            decoration: BoxDecoration(
              color: Colors.blueGrey[600],
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ],
    );
  }
}
