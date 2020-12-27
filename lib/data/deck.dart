import 'dart:convert';
import 'dart:core';
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

  factory Deck.fromJson(dynamic snapshotResponse, dynamic parsedDeckResponse, List<DeckCard> cardsList, List<MatchUp> matchUpList) {
    return Deck(
        snapshotResponse['tier'] as int,
        snapshotResponse['name'] as String,
        List.from(snapshotResponse['ranks']),
        parsedDeckResponse['deckType'] as String,
        parsedDeckResponse['description'] as String,
        parsedDeckResponse['heroName'] as String,
        parsedDeckResponse['playerClass'] as String,
        cardsList,
        matchUpList);
  }
}

class DeckCard {
  final int cardQuantity;
  final String name;
  final int cost;
  final String rarity;
  final int dust;

  DeckCard(this.cardQuantity, this.name, this.cost, this.rarity, this.dust);

  factory DeckCard.fromJson(dynamic json) {
    return DeckCard(
        json['cardQuantity'] as int,
        json['card']['name'] as String,
        json['card']['cost'] as int,
        json['card']['rarity'] as String,
        json['card']['dust'] as int);
  }
}

class MatchUp {
  String deckName;
  int forChance;

  MatchUp(this.deckName, this.forChance);

  factory MatchUp.fromJson(dynamic json) {
    return MatchUp(
        json['deckName'] as String,
        json['forChance'] as int);
  }
}

Future<List<Deck>> fetchDecks(http.Client client) async {
  final snapshotResponse =
      await client.get('https://tempostorm.com/api/snapshots/findOne?filter={"where":{"slug":"2020-12-14","snapshotType":"standard"},"include":[{"relation":"comments","scope":{"include":[{"relation":"author","scope":{"fields":["username","gravatarUrl"]}}],"order":"createdDate+DESC"}},{"relation":"deckMatchups","scope":{"include":[{"relation":"forDeck","scope":{"fields":["name","name_ru","playerClass"]}},{"relation":"againstDeck","scope":{"fields":["name","name_ru","playerClass"]}}]}},{"relation":"deckTiers","scope":{"include":[{"relation":"deck","scope":{"fields":["id","name","slug","playerClass"],"include":{"relation":"slugs","scope":{"fields":["linked","slug"]}}}},{"relation":"deckTech","scope":{"include":[{"relation":"cardTech","scope":{"include":[{"relation":"card","scope":{"fields":["name","name_ru","photoNames"]}}]}}]}}]}},{"relation":"authors","scope":{"include":[{"relation":"user","scope":{"fields":["username","social"]}}]}},{"relation":"votes","scope":{"fields":["direction","authorId"]}},{"relation":"slugs","scope":{"fields":["linked","slug"]}}]}');
  final Map<String, dynamic> parsed = jsonDecode(snapshotResponse.body);

  List<Deck> result = new List<Deck>();
  List<dynamic> deckTiers = parsed['deckTiers'];
  for (var snapshotDeck in deckTiers) {
    dynamic decks = snapshotDeck['deck'];
    dynamic slugs = decks['slugs'];
    print(slugs);
    String slug = slugs.first['slug'];

    final deckResponse =
    await client.get('https://tempostorm.com/api/decks/findOne?filter={"where":{"slug":"$slug"},"fields":["id","createdDate","name","name_ru","description","description_ru","playerClass","premium","dust","heroName","authorId","deckType","isPublic","chapters","chapters_ru","youtubeId","gameModeType","isActive","isCommentable","isMultilingual"],"include":[{"relation":"cards","scope":{"include":"card","scope":{"fields":["id","name","name_ru","cardType","cost","dust","photoNames"]}}},{"relation":"comments","scope":{"fields":["id","votes","voteScore","authorId","createdDate","text"],"include":{"relation":"author","scope":{"fields":["id","username","gravatarUrl"]}},"order":"createdDate+DESC"}},{"relation":"author","scope":{"fields":["id","username","gravatarUrl"]}},{"relation":"matchups","scope":{"fields":["forChance","deckName","deckName_ru","className"]}},{"relation":"votes","fields":["id","direction","authorId"]}]}');
    final Map<String, dynamic> parsedDeckResponse = jsonDecode(deckResponse.body);
    final matchUpResponse = parseMatchUp(parsedDeckResponse);
    final cardsResponse = parseCards(parsedDeckResponse);
    result.add(Deck.fromJson(snapshotDeck, parsedDeckResponse, cardsResponse, matchUpResponse));
  }

  return result;
}

List<DeckCard> parseCards(Map<String, dynamic> parsed) {
  List<DeckCard> result = new List<DeckCard>();
  List<dynamic> deckTiers = parsed['cards'];
  for (var x in deckTiers) {
    result.add(DeckCard.fromJson(x));
  }

  return result;
}

List<MatchUp> parseMatchUp(Map<String, dynamic> parsed) {
  List<MatchUp> result = new List<MatchUp>();
  List<dynamic> deckTiers = parsed['matchups'];
  for (var x in deckTiers) {
    result.add(MatchUp.fromJson(x));
  }

  return result;
}
