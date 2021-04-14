import 'package:flutter/cupertino.dart';
import 'package:flutter_youtube/src/components/youtube_bottom_sheet.dart';
import 'package:get/get.dart';

enum RouteName {Home,Explore,Add,Subs,Labrary}

//바텀네비게이션은 앱이 꺼질때까지 유지되어야하기 때문에 영속성을 부여하기위해 service로
class AppController extends GetxService {
  //get to 로 Get.find를 찾을 수 있다.
  static AppController get to => Get.find();

  //리액트버전으로
  RxInt currentIndex = 0.obs;

 //app dart에서 네비바를 선택하면 인덱스가 넘어옴 그걸 넣어줌
  void changePageIndex (int index){

    //Routename.value[currentindex와 routename.add일 경우에만 쇼 바텀시트를 호출
    if(RouteName.values[index] == RouteName.Add){
      _showBottomSheet();
    }else{
    //Routename.Add가 아닐경우만 아래의 커런트인덱스를 돌려줌
      //리액트버전으로 커런트index에 인덱스를 넣어줌
    currentIndex(index);
    }
  }

  //바텀시트의 메소드
  void _showBottomSheet (){
    Get.bottomSheet(YoutubeBottomSheet());
  }

}