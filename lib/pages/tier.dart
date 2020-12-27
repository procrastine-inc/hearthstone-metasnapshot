import 'package:flutter/material.dart';
import 'package:flutter_app/data/deck.dart';
import 'package:flutter_app/pages/deck.dart';

class TierPage extends StatelessWidget {
  final List<Deck> decks;

  TierPage({Key key, @required this.decks}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tier1'),
      ),
      body: ListView.builder(
        itemCount: decks.length,
        itemBuilder: (context, index) {
          return Card(
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
          );
        },
      ),
    );
  }
}