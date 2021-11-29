import 'package:flutter/material.dart';
import 'champion_portraits.dart';
import 'package:spell_checker/widgets/spell_timer.dart';

class ParticipantsList extends StatefulWidget {
  final List partsNamesFromMatch;
  final List spell1IdFromMatch;
  final List spell1CoolDownFromMatch;
  final List spell2IdFromMatch;
  final List spell2CoolDownFromMatch;
  final List championIdFromMatch;
  final Color colorFromMatch;

  final int indexFromMatch;
  ParticipantsList(
      {required this.partsNamesFromMatch,
      required this.spell1IdFromMatch,
      required this.spell1CoolDownFromMatch,
      required this.spell2IdFromMatch,
      required this.spell2CoolDownFromMatch,
      required this.championIdFromMatch,
      required this.indexFromMatch,
      required this.colorFromMatch});

  @override
  _ParticipantsListState createState() => _ParticipantsListState(
      gotPartsNames: partsNamesFromMatch,
      gotSpell1Id: spell1IdFromMatch,
      gotSpell1CoolDown: spell1CoolDownFromMatch,
      gotSpell2Id: spell2IdFromMatch,
      gotSpell2CoolDown: spell2CoolDownFromMatch,
      gotChampionId: championIdFromMatch,
      gotIndex: indexFromMatch,
      gotColor: colorFromMatch);
}

class _ParticipantsListState extends State<ParticipantsList> {
  final List gotPartsNames;
  final List gotSpell1Id;
  final List gotSpell1CoolDown;
  final List gotSpell2Id;
  final List gotSpell2CoolDown;
  final List gotChampionId;
  final int gotIndex;
  final Color gotColor;
  _ParticipantsListState(
      {required this.gotPartsNames,
      required this.gotSpell1Id,
      required this.gotSpell1CoolDown,
      required this.gotSpell2Id,
      required this.gotSpell2CoolDown,
      required this.gotChampionId,
      required this.gotIndex,
      required this.gotColor});
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
          padding: EdgeInsets.all(5),
          height: 110,
          decoration: BoxDecoration(
              color: gotColor,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: ChampionPortraits(
                    championNameFromMatch: gotChampionId[gotIndex],
                    summonerNameFromMatch: gotPartsNames[gotIndex],
                  ),
                ),
                Expanded(
                  child: SpellTimer(
                      spellIdFromMatch: gotSpell1Id[gotIndex],
                      spellCoolFromMatch: gotSpell1CoolDown[gotIndex]),
                ),
                Expanded(
                  child: SpellTimer(
                      spellIdFromMatch: gotSpell2Id[gotIndex],
                      spellCoolFromMatch: gotSpell2CoolDown[gotIndex]),
                ),
              ])),
    );
  }
}
