import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  final String summonerNameFromMatch;
  final String profileIconIdFromMatch;
  final String summonerLevelFromMatch;
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
              Stack(alignment: Alignment.center, children: <Widget>[
                Container(
                    height: 65,
                    width: 65,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      image: DecorationImage(
                          image: AssetImage(
                            "assets/images/forms/profileForm.png",
                          ),
                          fit: BoxFit.fill),
                    )),
                Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      image: DecorationImage(
                          image: AssetImage(
                            "assets/images/profileIcon/$profileIconIdFromMatch.png",
                          ),
                          fit: BoxFit.fill),
                    )),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                        height: 15,
                        width: 30,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          image: DecorationImage(
                              image: AssetImage(
                                "assets/images/forms/levelForm.png",
                              ),
                              fit: BoxFit.fill),
                        )),
                  ),
                ),
                Positioned.fill(
                    child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          summonerLevelFromMatch.toString(),
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ))),
              ]),
              Text(
                summonerNameFromMatch,
                overflow: TextOverflow.ellipsis,
              ),
            ])));
  }
}
