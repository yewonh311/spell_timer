import 'package:flutter/material.dart';

class SpellTimer extends StatefulWidget {
  final String spellIdFromMatch;
  final int spellCoolFromMatch;
  SpellTimer(
      {required this.spellIdFromMatch, required this.spellCoolFromMatch});

  @override
  _SpellTimerState createState() => _SpellTimerState(
      gotSpellId: spellIdFromMatch, gotSpellCool: spellCoolFromMatch);
}

class _SpellTimerState extends State<SpellTimer> {
  final String gotSpellId;
  final int gotSpellCool;
  bool textField = false;
  _SpellTimerState({required this.gotSpellId, required this.gotSpellCool});

  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Container(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
          TextButton(
              onPressed: () {
                setState(() {
                  textField = !textField;
                });
              },
              child: Container(
                  height: 60,
                  // width: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    image: DecorationImage(
                        image: AssetImage(
                          "assets/images/summonerSpell/$gotSpellId.png",
                        ),
                        fit: BoxFit.fill),
                  ))),
          textField
              ? Flexible(
                  child: Text(
                  "$gotSpellCool on",
                  style: TextStyle(fontSize: 12),
                ))
              : Text(""),
        ]));
  }
}
