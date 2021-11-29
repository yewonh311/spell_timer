import 'package:flutter/services.dart';
import 'dart:convert';

Future<dynamic> getKey() async {
  final jsonData = await rootBundle.loadString("assets/credentials.json");
  return json.decode(jsonData);
}

Future<dynamic> getChampionName() async {
  final jsonData = await rootBundle.loadString("assets/champion.json");
  return json.decode(jsonData);
}

Future<dynamic> getsummonerSpellName() async {
  final jsonData = await rootBundle.loadString("assets/summonerSpellName.json");
  return json.decode(jsonData);
}

Future<dynamic> getsummonerSpellCoolDown() async {
  final jsonData = await rootBundle.loadString("assets/spellCoolDown.json");
  return json.decode(jsonData);
}
