import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import 'package:HSmeta/components/text.dart';
import 'package:HSmeta/data/deck.dart';

class DeckPage extends StatelessWidget {
  final Deck deck;

  DeckPage({Key key, @required this.deck}) : super(key: key);

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
          title: textWidgets.header('Tier' + deck.tier.toString(), context),
        ),
        body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: ExactAssetImage("images/bcg1.png"),
                  fit: BoxFit.fitHeight
              ),
            ),
            child:SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      textWidgets.title(deck.name, context),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          textWidgets.paragraph('Hero name:', context),
                          Flexible(
                            child: Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: textWidgets.text(deck.heroName, context),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          textWidgets.paragraph('Player class:', context),
                          Flexible(
                            child: Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: textWidgets.text(deck.playerClass, context),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          textWidgets.paragraph('Deck type:', context),
                          Flexible(
                            child: Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: textWidgets.text(deck.deckType, context),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          textWidgets.paragraph('Total dust:', context),
                          Flexible(
                            child: Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: textWidgets.text(deck.dust.toString(), context),
                            ),
                          ),
                        ],
                      ),
                      textWidgets.paragraph('Description:', context),
                      textWidgets.text(deck.description, context),
                      textWidgets.paragraph('Matchups:', context),
                      deck.matchUps.length > 0 ?
                      Container(
                          alignment: Alignment.center,
                          width: 350, height: 350,
                          child: CustomRoundedBars(
                              transformMatchUp(deck.matchUps),
                              animate: false)
                      ) : textWidgets.text('No matchups available',context),
                      textWidgets.paragraph('Cards:',context),
                      CardsComponent(cards: deck.cards)
                    ]
                ),
              ),
            )
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
              child: Container(
                  decoration:
                  BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/bcg1.png'),
                      colorFilter: ColorFilter.mode(Colors.black38, BlendMode.overlay),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child:ListTile(
                    title: textWidgets.title(cards[index].name, context),
                    subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              textWidgets.paragraph('Rarity:', context),
                              Flexible(
                                child: Padding(
                                  padding: EdgeInsets.only(left: 20),
                                  child: textWidgets.text(cards[index].rarity, context),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              textWidgets.paragraph('Card quantity:', context),
                              Flexible(
                                child: Padding(
                                  padding: EdgeInsets.only(left: 20),
                                  child: textWidgets.text(cards[index].cardQuantity.toString(), context),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              textWidgets.paragraph('Mana cost:', context),
                              Flexible(
                                child: Padding(
                                  padding: EdgeInsets.only(left: 20),
                                  child: textWidgets.text(cards[index].cost.toString(), context),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              textWidgets.paragraph('Dust:', context),
                              Flexible(
                                child: Padding(
                                  padding: EdgeInsets.only(left: 20),
                                  child: textWidgets.text(cards[index].dust.toString(), context),
                                ),
                              ),
                            ],
                          ),
                        ]
                    ),
                  )
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
