import 'package:flutter/material.dart';
import 'package:flutter_app/pages/deckTrends.dart';
import 'package:flutter_app/pages/introduction.dart';
import 'package:flutter_app/components/text.dart';
import 'package:flutter_app/pages/observations.dart';
import 'package:flutter_app/pages/tier.dart';
import 'package:flutter_app/data/deck.dart';
import 'package:http/http.dart' as http;

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
      // body: SingleChildScrollView(
      //   child: Center(
      //     child: Column(
      //         children: [
      //           textWidgets.logo(),
      //           textWidgets.redirectButton('Introduction', IntroductionPage(), context),
      //           textWidgets.redirectButton('Observations', ObservationsPage(), context),
      //           textWidgets.redirectButton('Deck trends', DeckTrendsPage(), context), //change page
      //           textWidgets.redirectButton('Tier1', TierPage(tier: 1), context),
      //           textWidgets.redirectButton('Tier2', TierPage(tier: 2), context),
      //           textWidgets.redirectButton('Tier3', TierPage(tier: 3), context),
      //           textWidgets.redirectButton('Tier4', TierPage(tier: 4), context),
      //           textWidgets.redirectButton('Tier5', TierPage(tier: 5), context),
      //         ]
      //     ),
      //   ),
      // )
        body: FutureBuilder<List<Deck>>(
          future: fetchDecks(http.Client()),
              builder: (context, snapshot) {
                if (snapshot.hasError) print(snapshot.error);
                return snapshot.hasData ?
                SingleChildScrollView(
                  child:
                    Center(
                        child: Column(
                            children: [
                              textWidgets.logo(),
                              textWidgets.redirectButton(
                                  'Introduction', IntroductionPage(), context),
                              textWidgets.redirectButton(
                                  'Observations', ObservationsPage(), context),
                              textWidgets.redirectButton(
                                  'Deck trends', DeckTrendsPage(data: snapshot.data.toList(),), context),
                              //change page
                              textWidgets.redirectButton(
                                  'Tier1', TierPage(tier: 1, decks: snapshot.data.where((deck) => deck.tier == 1).toList(),),
                                  context),
                              textWidgets.redirectButton(
                                  'Tier2', TierPage(tier: 2, decks: snapshot.data.where((deck) => deck.tier == 2).toList(),),
                                  context),
                              textWidgets.redirectButton(
                                  'Tier3', TierPage(tier: 3, decks: snapshot.data.where((deck) => deck.tier == 3).toList(),),
                                  context),
                              textWidgets.redirectButton(
                                  'Tier4', TierPage(tier: 4, decks: snapshot.data.where((deck) => deck.tier == 4).toList(),),
                                  context),
                              textWidgets.redirectButton(
                                  'Tier5', TierPage(tier: 5, decks: snapshot.data.where((deck) => deck.tier == 5).toList(),),
                                  context),
                            ]
                        ),
                    )
                )
                    : Column(children: [textWidgets.logo(), Expanded(child: Container(alignment: Alignment.center, child: CircularProgressIndicator()))]);
              }
      )
    );
  }
}
