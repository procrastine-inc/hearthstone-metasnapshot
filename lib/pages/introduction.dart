import 'package:flutter/material.dart';
import 'package:flutter_app/components/text.dart';
import 'package:flutter_app/main.dart';
//delete this in future
const String usage =
'''This tier list shows the best decks to play in Ranked mode to maximize the 
chances of winning the game and climbing the ladder.

Click on the name of the archetype in each tier to expand more details about the deck.

The "Archetype Explanation" section gives a general explanation of the archetype 
as a whole. It will present playstyle strategies, discuss different variants of 
the deck, and help you identify the deck on ladder. The "Weekly Meta" section 
analyzes the role of the deck in the current week's meta, and focuses in on 
the nuances of playing the current week's featured deck variant.

The "Tech Decision" section suggests card substitution options that you may 
consider if you are frequently facing a particular type of deck on ladder (i.e., 
you are being swarmed by aggro, or constantly queue into control decks). The 
"Match-ups" section gives an approximate average percentage chance that you 
will win a game when facing another Tier 1 or Tier 2 deck.

Click on the "View Deck" button to view in-depth information about the deck, 
such as the card composition, mana curve, mulligans, and more. The date in the 
title of the deck is the date on which that variant of the deck was first posted 
on the Meta Snapshot. If the construction of a deck has not changed since then, 
the deck may be reused in a future Snapshot. Make sure to scroll down to read 
the latest discussion on the deck's current role in the meta.
''';

const String legend =
'''Tier S ("God Tier"): Overtuned decks that warp and control a large portion of 
the meta. (This tier may not always be present in the Snapshot if there are no 
overpoweringly imbalanced decks.)
Tier 1: Well-optimized decks with extremely efficient and overwhelmingly powerful 
combos and card synergies that makes losing against these decks feel helpless 
and unfair.
Tier 2: Competitive decks that have a few slight weaknesses (e.g., poor comeback 
mechanics or draw consistency); can still take games off top-tier decks with 
tech switches.
Tier 3: Average decks that aren't bad, but also aren't optimized or refined; 
decks that have styles not currently favored by the metagame.
Tier 4: Inconsistent decks that are unrefined, out-of-flavor, overly niche, or 
retired. Taking wins off upper-tier decks requires an intimate understanding of 
the role of every card in the deck.
Tier 5: Fun decks that should only be used if you play Hearthstone for the joy 
of the gameplay, rather than the joy of winning.
''';

const update =
'''The next Hearthstone Standard Meta Snapshot will be published on or before 
Dec. 29, 2020.
''';

class IntroductionPage extends StatelessWidget {

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
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    textWidgets.paragraph('HOW TO USE THE META SNAPSHOT', context),
                    textWidgets.text(usage, context),
                    textWidgets.paragraph('LEGEND:', context),
                    textWidgets.text(legend, context),
                    textWidgets.paragraph('NEXT UPDATE', context),
                    textWidgets.text(update, context),
                  ],
                ),
              ),
            )
        )
    );
  }
}
