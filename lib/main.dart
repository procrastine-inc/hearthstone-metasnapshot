import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:HSmeta/pages/deckTrends.dart';
import 'package:HSmeta/pages/introduction.dart';
import 'package:HSmeta/components/text.dart';
import 'package:HSmeta/pages/observations.dart';
import 'package:HSmeta/pages/tier.dart';
import 'package:HSmeta/data/deck.dart';

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
          height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: ExactAssetImage("images/bcg3.png"),
                  fit: BoxFit.fill
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(top: 50, bottom: 50),
              child: FutureBuilder<List<Deck>>(
                  future: fetchDecks(http.Client()),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) print(snapshot.error);
                    return snapshot.hasData ?
                    SingleChildScrollView(
                        child: Center(
                          child: Column(
                              children: [
                                textWidgets.logo(context),
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
                    ) : Column(children: [
                      textWidgets.logo(context),
                      Expanded(child: Container(height: MediaQuery.of(context).size.height, alignment: Alignment.center, child: CircularProgressIndicator())),
                      Text('loading data', style: TextStyle(color: Colors.white, fontSize: 18)),
                    ]);
                  }
              ),
            )
        )
    );
  }
}