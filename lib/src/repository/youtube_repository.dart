import 'package:flutter_youtube/src/models/video_result.dart';
import 'package:get/get.dart';

                            //http를 감싼것이라고 보면됨
class YouTubueRepository extends GetConnect{
  static YouTubueRepository get to => Get.find();

  @override
  void onInit() {
    //참조할 url의 베이스 url (맨앞에 공통)
    httpClient.baseUrl= "https://www.googleapis.com/";
    super.onInit();
  }

  //YoutubevideoRestul를 반환해준다
  Future<YoutubeVideoResult> loadVideos() async {
    //postman에서 채널내 검색 url 붙여주면된다.
    String url = "/youtube/v3/search?part=snippet&channelId=UCbMGBIayK26L4VaFrs5jyBw&maxResults=10&order=date&type=video&videoDefinition=high&key=AIzaSyBK0nf3FEpVjXyyO7pCHbCRfeoXhwWm-3A";
    //response 변수에 get을 사용해 (url을담아준다 들어올떄까지 기다리ㅏㅁ)
    //get connect 안에있는 기능 ~ url과 baseurl을 붙여준다.
    final response = await get(url);
    if(response.status.hasError){
      return Future.error('에러임 : ${response.statusText}');
    }else{
      //response의 바디가 not null이고 길이가 0보다 큰경우만 파싱해줌.
      print('아 리스폰스 바디 : ${response.body["items"]}');
      if(response.body['items'] != null && response.body['items'].length > 0){
        return YoutubeVideoResult.fromJson(response.body);
      }
    }
  }
}