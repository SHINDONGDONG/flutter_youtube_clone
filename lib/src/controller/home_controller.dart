
import 'package:flutter_youtube/src/models/video_result.dart';
import 'package:flutter_youtube/src/pages/home.dart';
import 'package:flutter_youtube/src/repository/youtube_repository.dart';
import 'package:get/get.dart';

class HomeCotroller extends GetxController{
  static HomeCotroller get to => Get.find();

  Rx<YoutubeVideoResult> youtubeRestul = YoutubeVideoResult().obs;


  @override
  void onInit() {
    // TODO: implement onInit
    _videoLoad();
    super.onInit();

  }

  //YoutubeRepsotory의 loadvideo를 불러옴.
  void _videoLoad() async {
    YoutubeVideoResult youtubeVideoResult = await YouTubueRepository.to.loadVideos();
    print(youtubeVideoResult.items.length);

    if(youtubeVideoResult != null &&
        youtubeVideoResult.items != null &&
        youtubeVideoResult.items.length > 0){
      youtubeRestul(youtubeVideoResult);
    }

  }

}