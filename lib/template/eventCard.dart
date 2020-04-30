import 'package:flutter/material.dart';
import 'package:Ever/template/colors.dart';

Widget eventType(category){
  if (category == 1){
    return  Container(
          child: Center(
              child: Text( 'Non-profit',
                style: TextStyle(
                    fontSize: 10,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold),
              )
          ),
          width: 70,
          height: 20,
          decoration: BoxDecoration(
            color: Colors.redAccent[100],
            borderRadius: BorderRadius.circular(5),
          ),
      );
  }
}

class eventCard extends StatelessWidget {
  final String eventName;
  final int category;
  eventCard({this.eventName, this.category});

  @override
  Widget build(BuildContext context) {
    //TODO Switch Column to stack
    return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Container(
            child: Stack(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 130, 0, 0),
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
                  padding: const EdgeInsets.fromLTRB(265,145,0,0),
                  child: eventType(category),
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
        );
  }
}
