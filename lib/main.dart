import 'package:flutter/material.dart';
import 'package:flutter_app/pages/deckTrends.dart';
import 'package:flutter_app/pages/introduction.dart';
import 'package:flutter_app/components/text.dart';
import 'package:flutter_app/pages/observations.dart';
import 'package:flutter_app/pages/tier.dart';
import 'package:flutter_app/data/deck.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData.dark(),
    home: HomePage(),
  ));
}

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
              children: [
                textWidgets.logo(),
                textWidgets.redirectButton('Introduction', IntroductionPage(), context),
                textWidgets.redirectButton('Observations', ObservationsPage(), context),
                textWidgets.redirectButton('Deck trends', DeckTrendsPage(), context), //change page
                textWidgets.redirectButton('Tier1', TierPage(tier: 1), context),
                textWidgets.redirectButton('Tier2', TierPage(tier: 2), context),
                textWidgets.redirectButton('Tier3', TierPage(tier: 3), context),
                textWidgets.redirectButton('Tier4', TierPage(tier: 4), context),
              ]
          ),
        ),
      )
    );
  }
}
