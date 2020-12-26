import 'package:flutter/material.dart';
import 'package:flutter_app/pages/deckTrends.dart';
import 'package:flutter_app/pages/introduction.dart';
import 'package:flutter_app/components/text.dart';
import 'package:flutter_app/pages/observations.dart';


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
      drawer: Drawer(
        child: ListView(
          children: [
            textWidgets.title('HSMeta', 10, 20, 0, 10, 45),
            textWidgets.redirectButton('Introduction', IntroductionPage(), context),
            textWidgets.redirectButton('Observations', ObservationsPage(), context),
            textWidgets.redirectButton('Deck trends', DeckTrendsPage(), context),
            textWidgets.redirectButton('Tier1', IntroductionPage(), context), //change page
            textWidgets.redirectButton('Tier2', IntroductionPage(), context), //change page
            textWidgets.redirectButton('Tier3', IntroductionPage(), context), //change page
            textWidgets.redirectButton('Tier4', IntroductionPage(), context) //change page
          ],
        ),
      ),
      body: Center(
        // child: Column(
        //     children: [
        //       textWidgets.logo(),
        //       textWidgets.redirectButton('Introduction', IntroductionPage(), context),
        //       textWidgets.redirectButton('Observations', ObservationsPage(), context),
        //       textWidgets.redirectButton('Deck trends', IntroductionPage(), context), //change page
        //       textWidgets.redirectButton('Tier1', IntroductionPage(), context), //change page
        //       textWidgets.redirectButton('Tier2', IntroductionPage(), context), //change page
        //       textWidgets.redirectButton('Tier3', IntroductionPage(), context), //change page
        //       textWidgets.redirectButton('Tier4', IntroductionPage(), context), //change page
        //     ]
        // ),
      ),
    );
  }
}
