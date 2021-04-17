import 'package:flutter_youtube/src/models/video.dart';

class YoutubeVideoResult{
  int totalResults;
  int resultPerPage;
  String nextPagetoken;
  List<Video> items;

  YoutubeVideoResult(
      {this.totalResults, this.resultPerPage, this.nextPagetoken,this.items});

  factory YoutubeVideoResult.fromJson(Map<String,dynamic> json)=>
      YoutubeVideoResult(
          totalResults: json["pageInfo"]["totalResults"],
          resultPerPage: json["pageInfo"]["resultsPerPage"],
          nextPagetoken: json["nextPageToken"] ?? "",
        //맵형태인데 넥스트 페이지 토큰이 맵형태가 아닌상태, ??는 nextpagetoken이 없으면 ""로 줘라
        items: List<Video>.from(
            json["items"].map((data) => Video.fromJson(data))));
}