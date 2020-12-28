import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/pages/introduction.dart';
import 'package:flutter_app/components/text.dart';
import 'package:flutter_app/pages/observations.dart';
import 'package:flutter_app/pages/tier.dart';
import 'package:flutter_app/data/deck.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      fontFamily: 'EncodeSansExpanded',
    ),
    home: HomePage(),
  ));
}

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration:
            BoxDecoration(
              color: Color.fromRGBO(0, 0, 0, 0.5),
              image: DecorationImage(
                image: AssetImage('images/bcg1.png'),
                colorFilter: ColorFilter.mode(Colors.black54, BlendMode.overlay),
                fit: BoxFit.cover,
              ),
            ),
          ),
          backgroundColor: Colors.transparent,
          title: textWidgets.header('Home', context),
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: ExactAssetImage("images/bcg3.png"),
                fit: BoxFit.fill
            ),
          ),
          child: Center(
            child: Column(
                children: [
                  textWidgets.logo(context),
                  textWidgets.redirectButton('Introduction', IntroductionPage(), context),
                  textWidgets.redirectButton('Observations', ObservationsPage(), context),
                  textWidgets.redirectButton('Deck trends', IntroductionPage(), context), //change page
                  textWidgets.redirectButton('Tier1', TierPage(decks: decks.where((deck) => deck.tier == 1).toList(), tier: "1"), context),
                  textWidgets.redirectButton('Tier2', TierPage(decks: decks.where((deck) => deck.tier == 2).toList(), tier: "2"), context),
                  textWidgets.redirectButton('Tier3', TierPage(decks: decks.where((deck) => deck.tier == 3).toList(), tier: "3"), context),
                  textWidgets.redirectButton('Tier4', TierPage(decks: decks.where((deck) => deck.tier == 4).toList(), tier: "4"), context),
                ]
            ),
          ),
        )
    );
  }
}
