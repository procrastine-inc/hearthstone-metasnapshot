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
}

final decks = <Deck>[
  Deck(1,'H1',[1,2,3,4],'j','sc','m','mnb',[DeckCard(1, 'j', 2, 'bj', 6), DeckCard(1, 'j', 2, 'bj', 6), DeckCard(1, 'j', 2, 'bj', 6), DeckCard(1, 'j', 2, 'bj', 6)], [MatchUp('cd','sd',7)]),
  Deck(1,'H1',[1,2,3,4],'j','sc','m','mnb',[DeckCard(1, 'j', 2, 'bj', 6), DeckCard(1, 'j', 2, 'bj', 6)], [MatchUp('cd','sd',7)]),
  Deck(2,'H2',[1,2,3,4],'j','sc','m','mnb',[DeckCard(1, 'j', 2, 'bj', 6), DeckCard(1, 'j', 2, 'bj', 6)], [MatchUp('cd','sd',7)]),
];
