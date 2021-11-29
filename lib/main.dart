import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spell_checker/screens/match_screen.dart';
import 'screens/search_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Summoner Spell Checking App',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: SearchSummoner(),
      getPages: [
        GetPage(name: '/match/:param', page: () => MatchScreen()),
      ],
    );
  }
}
