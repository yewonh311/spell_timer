import 'package:flutter/material.dart';
import '../models/active_game_by_summoner.dart';
import 'package:spell_checker/widgets/profile.dart';
import 'package:spell_checker/widgets/game_length_timer.dart';
import 'package:spell_checker/widgets/participants_list.dart';

class MatchScreen extends StatefulWidget {
  final String encryptIdFromSearch;
  final String summonerNameFromSearch;
  final int profileIconIdFromSearch;
  final int summonerLevelFromSearch;
  MatchScreen(
      {required this.encryptIdFromSearch,
      required this.summonerNameFromSearch,
      required this.profileIconIdFromSearch,
      required this.summonerLevelFromSearch});

  @override
  _MatchScreenState createState() => _MatchScreenState(
      gotEncryptId: encryptIdFromSearch,
      gotSummonerName: summonerNameFromSearch,
      gotProfileIconId: profileIconIdFromSearch,
      gotSummonerLevel: summonerLevelFromSearch);
}

class _MatchScreenState extends State<MatchScreen> {
  late Future<Participants> pars;
  final String gotEncryptId;
  final String gotSummonerName;
  final int gotProfileIconId;
  final int gotSummonerLevel;
  String notFound = "매칭중인 게임을 찾을 수 없습니다.";
  bool pressColor = false;
  bool pressText = false;
  _MatchScreenState(
      {required this.gotEncryptId,
      required this.gotSummonerName,
      required this.gotProfileIconId,
      required this.gotSummonerLevel});

  @override
  void initState() {
    super.initState();
  }

  _notActive() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        primary: true,
        backgroundColor: Colors.grey.shade300,
        body: Center(
          child: FutureBuilder<Participants>(
            future: pars = fetchParticipants(encryptId: gotEncryptId),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.waiting:
                  return CircularProgressIndicator();
                default:
                  if (snapshot.hasData) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          alignment: Alignment.topLeft,
                          children: <Widget>[
                            IconButton(
                              icon: Icon(Icons.arrow_back),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Profile(
                                summonerNameFromMatch: gotSummonerName,
                                profileIconIdFromMatch: gotProfileIconId,
                                summonerLevelFromMatch: gotSummonerLevel),
                            Column(
                              children: <Widget>[
                                Text(
                                  "게임 모드: ${snapshot.data!.gameMode.toString()}",
                                ),
                                Text(
                                  snapshot.data!.gameStartTime.toString(),
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary:
                                        pressColor ? Colors.blue : Colors.red,
                                  ),
                                  child: Text(pressText ? "전체보기" : "상대만 보기"),
                                  onPressed: () {
                                    setState(() {
                                      pressColor = !pressColor;
                                      pressText = !pressText;
                                    });
                                  },
                                ),
                              ],
                            ),
                            GameLengthTimer(
                                gameLengthFromMatch:
                                    snapshot.data!.gameLength.toString()),
                          ],
                        ),
                        Row(children: <Widget>[
                          Flexible(
                            child: ListView.separated(
                                separatorBuilder: (context, index) => Divider(),
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: 5,
                                itemBuilder: (BuildContext context, int index) {
                                  if (pressColor == false) {
                                    return Row(
                                      children: <Widget>[
                                        ParticipantsList(
                                            partsNamesFromMatch:
                                                snapshot.data!.partsNames,
                                            spell1IdFromMatch:
                                                snapshot.data!.spell1Id,
                                            spell1CoolDownFromMatch:
                                                snapshot.data!.spell1CoolDown,
                                            spell2IdFromMatch:
                                                snapshot.data!.spell2Id,
                                            spell2CoolDownFromMatch:
                                                snapshot.data!.spell2CoolDown,
                                            championIdFromMatch:
                                                snapshot.data!.championId,
                                            indexFromMatch: index,
                                            colorFromMatch:
                                                Colors.blue.shade100),
                                        ParticipantsList(
                                            partsNamesFromMatch:
                                                snapshot.data!.partsNames,
                                            spell1IdFromMatch:
                                                snapshot.data!.spell1Id,
                                            spell1CoolDownFromMatch:
                                                snapshot.data!.spell1CoolDown,
                                            spell2IdFromMatch:
                                                snapshot.data!.spell2Id,
                                            spell2CoolDownFromMatch:
                                                snapshot.data!.spell2CoolDown,
                                            championIdFromMatch:
                                                snapshot.data!.championId,
                                            indexFromMatch: index + 5,
                                            colorFromMatch:
                                                Colors.red.shade100),
                                      ],
                                    );
                                  }
                                  return Row(
                                    children: <Widget>[
                                      Container(
                                        child: ParticipantsList(
                                            partsNamesFromMatch:
                                                snapshot.data!.partsNames,
                                            spell1IdFromMatch:
                                                snapshot.data!.spell1Id,
                                            spell1CoolDownFromMatch:
                                                snapshot.data!.spell1CoolDown,
                                            spell2IdFromMatch:
                                                snapshot.data!.spell2Id,
                                            spell2CoolDownFromMatch:
                                                snapshot.data!.spell2CoolDown,
                                            championIdFromMatch:
                                                snapshot.data!.championId,
                                            indexFromMatch: index + 5,
                                            colorFromMatch:
                                                Colors.red.shade100),
                                      ),
                                    ],
                                  );
                                }),
                          ),
                        ])
                      ],
                    );
                  } else if (snapshot.hasError) {
                    return AlertDialog(
                      title: Text("에러"),
                      content: Text(
                        notFound,
                        maxLines: 2,
                        softWrap: true,
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text("OK"),
                        ),
                      ],
                    );
                  }
                  return CircularProgressIndicator();
              }
            },
          ),
        ),
      ),
    );
  }
}
