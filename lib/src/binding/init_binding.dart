import 'package:flutter_youtube/src/controller/app_controller.dart';
import 'package:get/get.dart';


//initBiding으로 상속을 바인딩을 받고
class InitBinding implements Bindings{
  @override

  //디펜던시에서 Get.put(원하는 컨트롤러) 를 put해주어 inital적으로 바인딩해주기
  void dependencies() {
    // TODO: implement dependencies
    Get.put(AppController());
  }
}