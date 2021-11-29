import 'package:flutter/material.dart';

class ChampionPortraits extends StatelessWidget {
  final String? championNameFromMatch;
  final String summonerNameFromMatch;
  ChampionPortraits(
      {required this.championNameFromMatch,
      required this.summonerNameFromMatch});

  @override
  Widget build(BuildContext context) {
    return Container(
        // height: 120,
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage(
                          "assets/images/champion/$championNameFromMatch.png",
                        ),
                        fit: BoxFit.fill),
                    // boxShadow: [
                    //   BoxShadow(
                    //       color: Colors.black,
                    //       offset: Offset(4, 6),
                    //       blurRadius: 50)
                    // ]
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  summonerNameFromMatch,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    height: 1,
                  ),
                ),
              ],
            )));
  }
}
