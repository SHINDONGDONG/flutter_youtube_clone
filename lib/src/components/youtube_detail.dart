import 'package:flutter/material.dart';
import 'package:get/get.dart';

class YoutubeDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        //넘어올 Named 파라메터를 받음 Get.parameters[""]
        child: Text(Get.parameters["videoId"]),
      ),
    );
  }
}
