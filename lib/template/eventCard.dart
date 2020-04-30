import 'package:flutter/material.dart';
import 'package:Ever/template/colors.dart';

Widget eventType(category) {
  if (category == true) {
    return Container(
      child: Center(
          child: Text(
        'Non-profit',
        style: TextStyle(
            fontSize: 10,
            color: white,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.bold),
      )),
      width: 70,
      height: 20,
      decoration: BoxDecoration(
        color: Color.fromRGBO(155, 0, 0, 0.6),
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}

class eventCard extends StatelessWidget {
  final String eventName;
  final String eventThumb;
  final bool isNonProfit;

  eventCard({this.eventName, this.isNonProfit, this.eventThumb});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Container(
        child: Stack(
          children: <Widget>[
            Positioned(
              left: 18.0,
              bottom: 13.0,
              child: Text(
                "$eventName",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    shadows: <Shadow>[
                      Shadow(
                        offset: Offset(2.5, 1.5),
                        blurRadius: 1.0,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ]),
              ),
            ),
            Positioned(
              right: 18.0,
              bottom: 13.0,
              child: isNonProfit ? eventType(isNonProfit) : Text(''),
            ),
          ],
        ),
        width: 350,
        height: 180,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(eventThumb),
          ),
          color: Colors.blueGrey[600],
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
