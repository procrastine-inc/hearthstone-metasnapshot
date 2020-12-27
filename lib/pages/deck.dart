import 'package:flutter/material.dart';
import 'package:flutter_app/components/text.dart';
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
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
            children: [
              textWidgets.title(deck.name, 5, 10, 30),
              textWidgets.title('Description', 5, 5, 20),
              // textWidgets.title('Description', 0, 0, 18),
              Text(deck.description, style: TextStyle(fontSize: 18))
            ]
        ),
      ),
    );
  }
}