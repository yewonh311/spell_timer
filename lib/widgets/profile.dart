import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  final String summonerNameFromMatch;
  final int profileIconIdFromMatch;
  final int summonerLevelFromMatch;
  Profile(
      {required this.summonerNameFromMatch,
      required this.profileIconIdFromMatch,
      required this.summonerLevelFromMatch});

  @override
  Widget build(BuildContext context) {
    return Container(
        // height: 120,
        child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Row(children: <Widget>[
              Stack(children: <Widget>[
                Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                      image: DecorationImage(
                          image: AssetImage(
                            "assets/images/profileIcon/$profileIconIdFromMatch.png",
                          ),
                          fit: BoxFit.fill),
                    )),
                Center(child: Text(summonerLevelFromMatch.toString()))
              ]),
              Text(summonerNameFromMatch),
            ])));
  }
}
