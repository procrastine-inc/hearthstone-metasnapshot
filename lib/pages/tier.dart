import 'package:flutter/material.dart';
import 'package:flutter_app/data/deck.dart';
import 'package:flutter_app/pages/deck.dart';
import 'package:http/http.dart' as http;

class TierPage extends StatelessWidget {
  // final List<Deck> decks;
  final int tier;

  TierPage({Key key, @required this.tier}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tier' + tier.toString()),
      ),
      body: FutureBuilder<List<Deck>>(
        future: fetchDecks(http.Client(), tier),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? ListView.builder(
                  itemCount: snapshot.data.where((deck) => deck.tier == tier).length,
                  itemBuilder: (context, index) {
                    return SingleChildScrollView(
                      child: Card(
                          child: ListTile(
                            title: Text(snapshot.data.where((deck) => deck.tier == tier).toList()[index].name),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DeckPage(deck: snapshot.data.where((deck) => deck.tier == tier).toList()[index]),
                                ),
                              );
                            },
                          )
                      ),
                    );
                  },
                )
              : Expanded(child: Container(alignment: Alignment.center, child: CircularProgressIndicator()));
        }
      ),
    );
  }
}