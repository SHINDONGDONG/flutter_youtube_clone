import 'package:get/get.dart';

 //바텀네비게이션은 앱이 꺼질때까지 유지되어야하기 때문에 영속성을 부여하기위해 service로
class AppController extends GetxService {
  //get to 로 Get.find를 찾을 수 있다.
  static AppController get to => Get.find();

  //리액트버전으로
  RxInt currentIndex = 0.obs;

 //app dart에서 네비바를 선택하면 인덱스가 넘어옴 그걸 넣어줌
  void changePageIndex (int index){
    //리액트버전으로 커런트index에 인덱스를 넣어줌
    currentIndex(index);
  }



}