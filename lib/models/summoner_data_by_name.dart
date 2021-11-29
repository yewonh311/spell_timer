import 'package:http/http.dart' as http;
import 'read_json.dart';

String server = 'kr';

Future<dynamic> getSummonerInfo({required String summonerName}) async {
  final cresFromJson = await getKey();
  final apiKey = cresFromJson["riot_api_key"];
  final headers = new Map<String, String>.from(cresFromJson["headers"]);
  var url =
      'https://$server.api.riotgames.com/lol/summoner/v4/summoners/by-name/$summonerName?api_key=$apiKey';
  var response = await http.get(
    Uri.parse(url),
    headers: headers,
  );
  return response;
}
