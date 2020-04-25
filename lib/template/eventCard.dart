import 'package:flutter/material.dart';
import 'package:Ever/template/colors.dart';


class eventCard extends StatelessWidget {

  final String eventName;
  final String category;
  eventCard({this.eventName, this.category});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(10,120,0,0),
                child: Text("$eventName", style: TextStyle(color: darkBackgroundColor,fontSize: 30, fontFamily: 'Montserrat'),),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(60,140,0,0),
                child: Container(
                  child: Center(child: Text("$category", style: TextStyle(fontSize: 10, fontFamily: 'Montserrat', fontWeight: FontWeight.bold),)),
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
          height: 170,
          decoration: BoxDecoration(
            color: orange,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        SizedBox(height: 10)
      ],
    );
  }
}
