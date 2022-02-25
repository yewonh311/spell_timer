import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:spell_checker/models/summoner_data_by_name.dart';
import 'package:spell_checker/widgets/pop_up.dart';

class SearchSummoner extends StatefulWidget {
  @override
  SearchSummonerState createState() => SearchSummonerState();
}

class SearchSummonerState extends State<SearchSummoner> {
  final TextEditingController _controller = TextEditingController();
  String empty = "Enter the summoner name.";
  String notFound = "Cannot found.";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('SpellT'),
        ),
        backgroundColor: Colors.blueGrey,
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Center(
            child: TextField(
              controller: _controller,
              cursorColor: Colors.black,
              onSubmitted: (value) async {
                await _navigate(_controller.text);
                _controller.clear();
              },
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintStyle: TextStyle(fontSize: 16),
                hintText: "Summoner Name",
                suffixIcon: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    IconButton(
                        onPressed: () {
                          _controller.clear();
                        },
                        icon: Icon(Icons.clear)),
                    IconButton(
                      icon: Icon(Icons.search),
                      color: Colors.blueGrey,
                      onPressed: () async {
                        await _navigate(_controller.text);
                        _controller.clear();
                      },
                    ),
                  ],
                ),
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
              ),
            ),
          ),
        )));
  }

  _navigate(var text) async {
    if (text.isNotEmpty) {
      var response = await getSummonerInfo(summonerName: text);
      final Map<String, dynamic>? data = json.decode(response.body);
      if (response.statusCode == 200) {
        Get.toNamed(
            '/match/${data?["id"]}?sumName=${data?["name"]}&iconId=${data?["profileIconId"]}&sumLevel=${data?["summonerLevel"]}');
        print(data?["profileIconId"]);
      } else {
        alert(context, notFound, response.statusCode);
      }
      return CircularProgressIndicator();
    } else if (text.isEmpty) {
      alert(context, empty, 200);
    }
  }
}
