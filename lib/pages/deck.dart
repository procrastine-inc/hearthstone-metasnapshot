import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app/components/text.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter_app/data/deck.dart';

class DeckPage extends StatelessWidget {
  final Deck deck;

  DeckPage({Key key, @required this.deck}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(deck.name),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  textWidgets.title(deck.name, 5, 10, 30),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      textWidgets.title('Hero name:', 5, 5, 20),
                      Flexible(
                        child: Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Text(deck.heroName, style: TextStyle(fontSize: 18)),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      textWidgets.title('Player class:', 5, 5, 20),
                      Flexible(
                        child: Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Text(deck.playerClass, style: TextStyle(fontSize: 18)),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      textWidgets.title('Deck type:', 5, 5, 20),
                      Flexible(
                        child: Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Text(deck.deckType, style: TextStyle(fontSize: 18)),
                        ),
                      ),
                    ],
                  ),
                  textWidgets.title('Description:', 5, 5, 20),
                  Text(deck.description, style: TextStyle(fontSize: 18)),
                  textWidgets.title('Matchups:', 5, 5, 20),
                  Container(alignment: Alignment.center, width: 350, height: 350, child: CustomRoundedBars(transformMatchUp(deck.matchUps), animate: false)),
                  textWidgets.title('Cards:', 5, 5, 20),
                  CardsComponent(cards: deck.cards)
                ]
            ),
          ),
        )
    );
  }
}

class CardsComponent extends StatelessWidget {
  final List<DeckCard> cards;

  CardsComponent({Key key, @required this.cards}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: cards.length,
        itemBuilder: (context, index) {
          return Card(
              child: ListTile(
                title: textWidgets.title(cards[index].name, 5, 10, 20),
                subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          textWidgets.title('Rarity:', 5, 5, 18),
                          Flexible(
                            child: Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Text(cards[index].rarity, style: TextStyle(fontSize: 18)),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          textWidgets.title('Card quantity:', 5, 5, 18),
                          Flexible(
                            child: Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Text(cards[index].cardQuantity.toString(), style: TextStyle(fontSize: 18)),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          textWidgets.title('Mana cost:', 5, 5, 18),
                          Flexible(
                            child: Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Text(cards[index].cost.toString(), style: TextStyle(fontSize: 18)),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          textWidgets.title('Dust:', 5, 5, 18),
                          Flexible(
                            child: Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Text(cards[index].dust.toString(), style: TextStyle(fontSize: 18)),
                            ),
                          ),
                        ],
                      ),
                    ]
                ),
              )
          );
        },
      ),
    );
  }
}

List<charts.Series<MatchUp, String>> transformMatchUp(List<MatchUp> data) {
  return [
    new charts.Series<MatchUp, String>(
      id: 'Matchup',
      colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
      // colorFn: (_, __) => charts.ColorUtil.fromDartColor(Colors.primaries[Random().nextInt(Colors.primaries.length)]),
      domainFn: (MatchUp element, _) => element.deckName,
      measureFn: (MatchUp element, _) => element.forChance,
      labelAccessorFn: (MatchUp element, _) =>
        '${element.forChance.toString()}%',
      data: data,
    )
  ];
}

class CustomRoundedBars extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  CustomRoundedBars(this.seriesList, {this.animate});

  @override
  Widget build(BuildContext context) {
    return new charts.BarChart(
      seriesList,
      animate: animate,
      barRendererDecorator: new charts.BarLabelDecorator(
        insideLabelStyleSpec: new charts.TextStyleSpec(
            fontSize: 18,
            color: charts.Color.white),
        outsideLabelStyleSpec: new charts.TextStyleSpec(
            fontSize: 18,
            color: charts.Color.white)
      ),
      domainAxis: new charts.OrdinalAxisSpec(
          renderSpec: new charts.SmallTickRendererSpec(
              labelStyle: new charts.TextStyleSpec(
                  fontSize: 16, // size in Pts.
                  color: charts.MaterialPalette.white),
              labelRotation: 50,
              lineStyle: new charts.LineStyleSpec(
                  color: charts.MaterialPalette.white))),
      primaryMeasureAxis: new charts.NumericAxisSpec(
        tickProviderSpec: new charts.BasicNumericTickProviderSpec(
            //dataIsInWholeNumbers: true,
            desiredTickCount: 6
        ),
        renderSpec: new charts.GridlineRendererSpec(
            labelStyle: new charts.TextStyleSpec(
                fontSize: 16, // size in Pts.
                color: charts.MaterialPalette.white),
            lineStyle: new charts.LineStyleSpec(
                color: charts.MaterialPalette.white)),
        viewport: new charts.NumericExtents(0, 100),
      ),
      defaultRenderer: new charts.BarRendererConfig(
          cornerStrategy: const charts.ConstCornerStrategy(30)),
    );
  }
}
