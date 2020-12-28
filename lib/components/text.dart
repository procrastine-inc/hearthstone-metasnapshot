import 'package:flutter/material.dart';

class CustomTextStyle {
  static TextStyle text(BuildContext context) {
    return Theme.of(context).textTheme.headline1.copyWith(
      color: Colors.white,
      fontSize: 18,
      fontFamily: 'EncodeSansExpanded',
    );
  }
  static TextStyle paragraph(BuildContext context) {
    return Theme.of(context).textTheme.headline1.copyWith(
      color: Colors.cyanAccent,
      fontSize: 28,
      fontFamily: 'Teko',
      fontWeight: FontWeight.w500,
    );
  }
  static TextStyle title(BuildContext context) {
    return Theme.of(context).textTheme.headline1.copyWith(
      color: Colors.white,
      fontSize: 34,
      fontFamily: 'Teko',
      fontWeight: FontWeight.w500,
    );
  }
  static TextStyle header(BuildContext context) {
    return Theme.of(context).textTheme.headline1.copyWith(
      color: Colors.white,
      fontFamily: 'Teko',
      fontSize: 40,
    );
  }
  static TextStyle logo(BuildContext context) {
    return Theme.of(context).textTheme.headline1.copyWith(
      color: Colors.white,
      fontFamily: 'Teko',
      fontSize: 45,
      fontWeight: FontWeight.bold,
    );
  }
  static TextStyle button(BuildContext context) {
    return Theme.of(context).textTheme.headline1.copyWith(
        color: Colors.white,
        fontFamily: 'Teko',
        fontSize: 25
    );
  }
}

class textWidgets {
  static Widget header(String text, BuildContext context){
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(text, style: CustomTextStyle.header(context)),
    );
  }

  static Widget title(String text, BuildContext context){
    return Padding(
      padding: EdgeInsets.only(top: 5, bottom: 10),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(text,
          style: CustomTextStyle.title(context),
        ),
      ),
    );
  }

  static Widget paragraph(String text, BuildContext context){
    return Padding(
      padding: EdgeInsets.only(top: 5, bottom: 5),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(text,
          style: CustomTextStyle.paragraph(context),
        ),
      ),
    );
  }

  static Widget text(String text, BuildContext context){
    return Align(
        alignment: Alignment.centerLeft,
        child: Text(text, style: CustomTextStyle.text(context)),
      );
  }

  static Widget logo(BuildContext context){
    return Padding(
      padding: EdgeInsets.only(top: 0, bottom: 10),
      child: Align(
        child: Text('HSmeta', style: CustomTextStyle.logo(context)),
      ),
    );
  }

  static Widget redirectButton(String name, Widget func, BuildContext  context){
    return Padding(
        padding: EdgeInsets.all(10),
        child: Container(
            height: 50,
            width: MediaQuery.of(context).size.width*0.7,
            child: Container(
                decoration:
                BoxDecoration(
                  color: Color.fromRGBO(0, 0, 0, 0.5),
                  image: DecorationImage(
                    image: AssetImage('images/bcg1.png'),
                    colorFilter: ColorFilter.mode(Colors.black26, BlendMode.overlay),
                    fit: BoxFit.cover,
                  ),
                ),
                child: RaisedButton(
                  child: Text(name, style: CustomTextStyle.button(context)),
                  color: Colors.transparent,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => func),
                    );
                  },
                )
            )
        )
    );
  }
}
