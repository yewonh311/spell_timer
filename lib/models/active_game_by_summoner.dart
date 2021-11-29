import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'read_json.dart';

class Participants {
  final String gameMode;
  final int mapId;
  final int queueType;
  final int gameLength;
  final List participants;
  final partsNames;
  final teamId;
  final spell1Id;
  final spell1CoolDown;
  final spell2Id;
  final spell2CoolDown;
  final championId;

  Participants({
    required this.gameMode,
    required this.mapId,
    required this.queueType,
    required this.gameLength,
    required this.participants,
    required this.partsNames,
    required this.teamId,
    required this.spell1Id,
    required this.spell1CoolDown,
    required this.spell2Id,
    required this.spell2CoolDown,
    required this.championId,
  });
}

_toList(list, String info) {
  List<String> infoToList = [];
  for (int i = 0; i < 10; i++) {
    infoToList.add(list[i][info].toString());
  }
  return infoToList;
}

_idsToJsonData(list, String info, json) {
  List<dynamic> ids = [];
  var jsonData = json;
  for (int i = 0; i < 10; i++) {
    ids.add(jsonData[list[i][info].toString()]);
  }
  return ids;
}

String server = 'kr';

Future<Participants> fetchParticipants({required String encryptId}) async {
  final cresFromJson = await getKey();
  final apiKey = cresFromJson["riot_api_key"];
  final headers = new Map<String, String>.from(cresFromJson["headers"]);
  final url =
      'https://$server.api.riotgames.com/lol/spectator/v4/active-games/by-summoner/$encryptId?api_key=$apiKey';
  final response = await http.get(Uri.parse(url), headers: headers);
  final Map<String, dynamic> data = json.decode(response.body);
  if (response.statusCode == 200) {
    return Participants(
        gameMode: data["gameMode"],
        mapId: data["mapId"],
        queueType: data["gameQueueConfigId"],
        gameLength: data["gameLength"],
        participants: data["participants"],
        partsNames: _toList(data["participants"], "summonerName"),
        teamId: _toList(data["participants"], "teamId"),
        spell1Id: _idsToJsonData(
            data["participants"], "spell1Id", await getsummonerSpellName()),
        spell1CoolDown: _idsToJsonData(
            data["participants"], "spell1Id", await getsummonerSpellCoolDown()),
        spell2Id: _idsToJsonData(
            data["participants"], "spell2Id", await getsummonerSpellName()),
        spell2CoolDown: _idsToJsonData(
            data["participants"], "spell2Id", await getsummonerSpellCoolDown()),
        championId: _idsToJsonData(
            data["participants"], "championId", await getChampionName()));
  }
  throw Error.safeToString(response.statusCode);
}
