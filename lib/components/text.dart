import 'package:flutter/material.dart';

class textWidgets {

  static Widget title(
      String text,
      double left,
      double top,
      double right,
      double bottom,
      double fontSize){
    return Padding(
      padding: EdgeInsets.fromLTRB(left, top, right, bottom),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(text,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  static Widget logo(){
    return Padding(
      padding: EdgeInsets.only(top: 50, bottom: 10),
      child: Align(
        child: Text('HSmeta',
          style: TextStyle(
            fontSize: 45,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  static Widget redirectButton(String name, Widget func, BuildContext  context){
    return Padding(
        padding: EdgeInsets.all(10),
        child: Container(
            height: 50,
            width: MediaQuery.of(context).size.width*0.7,
            child: RaisedButton(
              child: Text(name, style: TextStyle(fontSize: 18),),
              color: Colors.blueAccent,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => func),
                );
              },
            )
        )
    );
  }
}