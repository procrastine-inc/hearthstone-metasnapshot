import 'package:flutter/material.dart';
import 'package:flutter_app/components/text.dart';

const String intro =
'''Welcome to the 119th edition of the Tempo Storm Hearthstone Standard Meta 
Snapshot! A balance patch was just announced that heavily targets one of the 
best classes in the format: Demon Hunter. The class has been as strong in the 
Madness at the Darkmoon Faire meta as it was in Scholomance Academy, with Soul 
Demon Hunter and Tempo Demon Hunter assuming the top and third-highest positions 
on the tier list. 

The discrepancy in power level between Tiers 1 and 2 are significant, as the 
strength of ETC Warrior, Secret Rogue, and the previously mentioned Demon Hunter 
decks are well beyond what most Tier 2 can answer consistently without sacrificing 
their own gameplans. That being said, Evolve Shaman is on the cusp of making Tier 
1, but we’ve ultimately decided to place it in Tier 2. Players have recently 
opted out of running Revolve as a card and are instead going for a full-on Weapon 
Evolve approach.

Mage and Warlock are the two classes facing the most difficult challenges in 
Standard, with neither class having the tools to find a place in either Tier 1 
or Tier 2. Zoo Warlock continues to struggle in the current meta and finds itself 
sitting at the top of Tier 3. While this archetype is the premier Warlock deck 
for ladder, the class has seen no innovations and continues to play the same, 
relatively inconsistent build. Cyclone Mage is the best Mage deck in the current 
meta, but its position in the middle of Tier 3 showcases how the class as a whole 
is still struggling to find its niche.

We will likely see more experimentation with Mage and Warlock once the balance 
patch targeting Demon Huter goes into effect, but if Secret Rogue and ETC Warrior 
are going to be seriously contested for their positions in Tier 1, then answers 
are more likely to be found outside of the options made available by Mage and 
Warlock decks.

Druid gained a couple new decks seeing representation on the tier list. While 
Highlander Druid and Malygos Druid will need the meta to slow down significantly 
to find a place higher than Tier 3, their entry into the tier list before the 
balance patch represents exciting opportunities in the post-patch meta. For 
control players looking to take the most advantage of sub-par aggro decks seeking 
to fill the void left behind by Demon Hunter, these Druid decks will receive a 
fair amount of attention.

ETC Warrior continues to be more than just flavor of the week, and maintains its 
spot in Tier 1 as a new archetype to the Standard format. The archetype's ability 
to clear most board states, survive against aggressive gameplans, and perform 
upward of 30 damage makes this deck a real threat in the metagame—so much of a 
threat that players have started teching against it to raise their win percentage 
by however many ponts they can get.

We will look forward to seeing how Demon Hunter performs in the new post-patch 
meta, and will close out the year with at least one more Meta Snapshot before 
December 29. Thank you for reading this edition of the Tempo Storm Hearthstone 
Standard Meta Snapshot, and happy laddering!
''';

class ObservationsPage extends StatelessWidget {

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
        resizeToAvoidBottomPadding: false,
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: ExactAssetImage("images/bcg1.png"),
                fit: BoxFit.fitHeight
            ),
          ),
          child:SingleChildScrollView(
            child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    textWidgets.paragraph('THOUGHTS AND OBSERVATIONS', context),
                    textWidgets.text(intro, context),
                  ],
                )
            ),
          ),
        )
    );
  }
}
