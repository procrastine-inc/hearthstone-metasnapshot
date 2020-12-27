import 'dart:convert';
import 'dart:core';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class Deck {
  final int tier;
  final String name;
  final List<int> rank;
  final String deckType;
  final String description;
  final String heroName;
  final String playerClass;
  final List<DeckCard> cards;
  final List<MatchUp> matchUps;

  Deck(
      this.tier,
      this.name,
      this.rank,
      this.deckType,
      this.description,
      this.heroName,
      this.playerClass,
      this.cards,
      this.matchUps);
}

class DeckCard {
  final int cardQuantity;
  final String name;
  final int cost;
  final String rarity;
  final int dust;

  DeckCard(this.cardQuantity, this.name, this.cost, this.rarity, this.dust);
}

class MatchUp {
  String deckName;
  String className; // you can remove it
  int forChance;

  MatchUp(this.deckName, this.className, this.forChance);

  factory MatchUp.fromJson(dynamic json) {
    return MatchUp(
        json['deckName'] as String,
        json['className'] as String,
        json['forChance'] as int);
  }
}

Future<List<MatchUp>> fetchMatchUp(http.Client client, String slug) async {
  final response =
  await client.get('https://tempostorm.com/api/decks/findOne?filter={"where":{"slug":$slug},"fields":["id","createdDate","name","name_ru","description","description_ru","playerClass","premium","dust","heroName","authorId","deckType","isPublic","chapters","chapters_ru","youtubeId","gameModeType","isActive","isCommentable","isMultilingual"],"include":[{"relation":"cards","scope":{"include":"card","scope":{"fields":["id","name","name_ru","cardType","cost","dust","photoNames"]}}},{"relation":"comments","scope":{"fields":["id","votes","voteScore","authorId","createdDate","text"],"include":{"relation":"author","scope":{"fields":["id","username","gravatarUrl"]}},"order":"createdDate+DESC"}},{"relation":"author","scope":{"fields":["id","username","gravatarUrl"]}},{"relation":"matchups","scope":{"fields":["forChance","deckName","deckName_ru","className"]}},{"relation":"votes","fields":["id","direction","authorId"]}]}');

  // Use the compute function to run parsePhotos in a separate isolate.
  return compute(parseMatchUp, response.body);
  // return parseRankings(response.body);
}

List<MatchUp> parseMatchUp(String responseBody) {
  final Map<String, dynamic> parsed = jsonDecode(responseBody);

  List<MatchUp> result = new List<MatchUp>();
  List<dynamic> deckTiers = parsed['matchups'];
  for (var x in deckTiers) {
    result.add(MatchUp.fromJson(x));
  }

  return result;
}

final decks = <Deck>[
  Deck(1,'H1',[1,2,3,4],'j','sc','m','mnb',[DeckCard(1, 'j', 2, 'bj', 6), DeckCard(1, 'j', 2, 'bj', 6), DeckCard(1, 'j', 2, 'bj', 6), DeckCard(1, 'j', 2, 'bj', 6)], [MatchUp('cd','sd',7)]),
  Deck(1,'H1',[1,2,3,4],'j','sc','m','mnb',[DeckCard(1, 'j', 2, 'bj', 6), DeckCard(1, 'j', 2, 'bj', 6)], [MatchUp('cd','sd',7)]),
  Deck(2,'H2',[1,2,3,4],'j','sc','m','mnb',[DeckCard(1, 'j', 2, 'bj', 6), DeckCard(1, 'j', 2, 'bj', 6)], [MatchUp('cd','sd',7)]),
];