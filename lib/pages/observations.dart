import 'package:flutter/material.dart';
import 'package:flutter_app/components/text.dart';
//delete this in future
const String usage = "This tier list shows the best decks to play in Ranked mode to maximize the chances of winning the game and climbing the ladder.";

class ObservationsPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("HSmeta"),
        ),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              textWidgets.title('Observations', 5, 10, 30),
              Text(usage, style: TextStyle(fontSize: 18))
            ],
          ),
        )
    );
  }
}