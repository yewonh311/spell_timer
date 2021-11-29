import 'package:flutter/material.dart';

class GameLengthTimer extends StatelessWidget {
  final String gameLengthFromMatch;
  GameLengthTimer({required this.gameLengthFromMatch});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text("Game time"),
          Text(gameLengthFromMatch.toString()),
        ],
      ),
    );
  }
}
