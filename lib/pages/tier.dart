import 'package:flutter/material.dart';
import 'package:flutter_app/data/deck.dart';
import 'package:flutter_app/pages/deck.dart';

class TierPage extends StatelessWidget {
  final List<Deck> decks;
  final String tier;

  TierPage({Key key, @required this.decks, @required this.tier}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tier' + tier),
      ),
      body: ListView.builder(
        itemCount: decks.length,
        itemBuilder: (context, index) {
          return SingleChildScrollView(
            child: Card(
                child: ListTile(
                  title: Text(decks[index].name),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DeckPage(deck: decks[index]),
                      ),
                    );
                  },
                )
            ),
          );
        },
      ),
    );
  }
}