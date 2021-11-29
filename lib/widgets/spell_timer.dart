import 'dart:ui';
import 'package:flutter/material.dart';
import 'dart:async';

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

  late Timer _timer;
  int? _coolTime;
  bool _isProcessing = false;

  void blurSpell() {
    SizedBox(
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset('assets/images/summonerSpell/$gotSpellId.png',
              fit: BoxFit.cover),
          Container(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                color: Colors.grey.withOpacity(0.1),
                alignment: Alignment.center,
                child: Text("$_coolTime"),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void startTimer() {
    _coolTime = this.gotSpellCool;
    const oneSec = const Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (Timer timer) {
      if (_coolTime == 0) {
        setState(() {
          timer.cancel();
        });
      } else if (!_isProcessing) {
        setState(() {
          _coolTime = (_coolTime! - 1);
        });
      } else if (_isProcessing) {
        return;
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Container(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
          FloatingActionButton(
            child: Container(
              // height: 60,
              // width: 50,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      "assets/images/summonerSpell/$gotSpellId.png",
                    ),
                    fit: BoxFit.fill),
              ),
            ),
            onPressed: () => {
              setState(() {
                startTimer();
                // _incrementCounter();
                // _isProcessing = !_isProcessing;
              })
            },
          ),
          if (_coolTime == null) Text(""),
          if (_coolTime != null)
            Container(
              child: Column(
                children: [
                  Container(
                    child: Container(
                      decoration: BoxDecoration(),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
                        child: Container(
                          color: Colors.grey.withOpacity(0.005),
                          alignment: Alignment.topCenter,
                          child: Text(
                            "$_coolTime",
                            style: TextStyle(fontSize: 15, color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ]));
  }
}
