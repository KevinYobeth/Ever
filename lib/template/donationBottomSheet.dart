import 'package:flutter/material.dart';
import 'package:Ever/template/colors.dart';

void donationBottomSheet(context,
    {String bankAccount, String bankAccountName}) {
  showModalBottomSheet(
    context: context,
    elevation: 0,
    backgroundColor: Colors.transparent,
    builder: (BuildContext bc) {
      return FractionallySizedBox(
        heightFactor: (MediaQuery.of(context).size.height * 0.55)/ MediaQuery.of(context).size.height,
        child: Container(
          height: 1000,
          decoration: BoxDecoration(
            color: darkBackgroundColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Stack(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(170, 10, 170, 0),
                child: Container(
                  height: 7,
                  width: 60,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(255, 255, 255, 0.4),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              DraggableScrollableSheet(
                initialChildSize: 0.95,
                minChildSize: 0.5,
                builder:
                    (BuildContext context, ScrollController scrollController) {
                  return SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 30, 10, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text('Please kindly transfer your donation to',
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                color: white,
                                fontSize: 15,
                              )),
                          SizedBox(
                            height: 20,
                          ),
                          Text('$bankAccount',
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  color: white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold)),
                          Text('a/n',
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                color: white,
                                fontSize: 20,
                              )),
                          Text('$bankAccountName',
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                color: white,
                                fontSize: 20,
                              )),
                          SizedBox(height: 15,),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                             decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(10)
                             ),
                             child: FlatButton(
                                color: Colors.green,
                                child: Text(
                                  'Done',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: white,
                                    fontSize: 20,
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              )
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      );
    },
  );
}
