import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spell_checker/screens/search_screen.dart';

void alert(BuildContext context, String alertMessage, int statusCode) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      if (statusCode == 200) {
        return AlertDialog(
          title: Text("ERROR"),
          content: Text(
            alertMessage,
            maxLines: 2,
            softWrap: true,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Get.offAll(() => SearchSummoner());
              },
              child: Text("OK"),
            ),
          ],
        );
      } else {
        return AlertDialog(
          title: Text("EROOR"),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                alertMessage,
              ),
              Text("Error Code : $statusCode")
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Get.offAll(() => SearchSummoner());
              },
              child: Text("OK"),
            ),
          ],
        );
      }
    },
  );
}
