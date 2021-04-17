import 'package:flutter_youtube/src/controller/app_controller.dart';
import 'package:flutter_youtube/src/controller/home_controller.dart';
import 'package:flutter_youtube/src/repository/youtube_repository.dart';
import 'package:get/get.dart';


//initBiding으로 상속을 바인딩을 받고
class InitBinding implements Bindings{
  @override

  //디펜던시에서 Get.put(원하는 컨트롤러) 를 put해주어 inital적으로 바인딩해주기
  void dependencies() {
    // TODO: implement dependencies
    //Get서비스가 아니기때문에 permanent 트루로 설정//영구적으로 사용
    Get.put(YouTubueRepository(),permanent: true);
    Get.put(AppController());
  }
}