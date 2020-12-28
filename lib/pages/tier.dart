import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:HSmeta/data/deck.dart';
import 'package:HSmeta/pages/deck.dart';
import 'package:HSmeta/components/text.dart';


class TierPage extends StatelessWidget {
  final List<Deck> decks;
  final int tier;

  TierPage({Key key, @required this.decks, @required this.tier}) : super(key: key);

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
          title: textWidgets.header('HSmeta', context),
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: ExactAssetImage("images/bcg1.png"),
                fit: BoxFit.fitHeight
            ),
          ),
          child: ListView.builder(
            itemCount: decks.length,
            itemBuilder: (context, index) {
              return SingleChildScrollView(
                child: Card(
                  child: Container(
                    decoration:
                    BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('images/bcg1.png'),
                        colorFilter: ColorFilter.mode(Colors.black38, BlendMode.overlay),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: ListTile(
                      title: Text(decks[index].name, style: CustomTextStyle.button(context)),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DeckPage(deck: decks[index]),
                          ),
                        );
                      },
                    ),
                  ),
                  color: Colors.transparent,
                ),
              );
            },
          ),
        )
    );
  }
}