import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_youtube/src/pages/explore.dart';
import 'package:flutter_youtube/src/pages/home.dart';
import 'package:flutter_youtube/src/pages/library.dart';
import 'package:flutter_youtube/src/pages/subs.dart';
import 'package:get/get.dart';

import 'controller/app_controller.dart';

//가장 루트경로가 되는 페이지
class App extends GetView<AppController> { //Getview에 Appcontroller를 넣어줌으로써 컨트롤러를 무조건 사용가능
  double iconSize = 22.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx((){
          // ignore: missing_return, missing_return
          //Enum Type으로 정확하게 넣어줌.
          switch(RouteName.values[controller.currentIndex.value]){
            case RouteName.Home:
              return Home();
              break;
            case RouteName.Explore:
              return Explore();
              break;
              break;
            case RouteName.Subs:
              return Subs();
              break;
            case RouteName.Labrary:
              return Labrary();
              break;
            case RouteName.Add:
              break;
          }
          return Container(); //아무것도 아닐때
        }),  //바텀네비게이션 커런트에 홈이 오기때문에 HomePage를 첫번째로 넣어준다.
      ),                  //Obx로 유연한 상태관리 적용
      bottomNavigationBar: Obx(()=>BottomNavigationBar(
        type: BottomNavigationBarType.fixed,//타입은  fixed
        currentIndex: controller.currentIndex.value, //컨트롤러에 있던 currentindex의 밸류값을 가져옴
        selectedItemColor: Colors.black, //바텀 네비바가 선택되었을 때 라벨이 검정색이 되도록
        showSelectedLabels: true,//라벨이 보이도록 트루로 설정해준다.
        onTap: controller.changePageIndex,  //같은 인자값을 받기때문에 굳이 인덱스를 넘겨받지 않아도됨.
            // (index){
          //Getx의 리액트버전 상태관리로 스테이트를 바꿔준다.
          // AppController.to.changePageIndex(index); //이것도 가능하고
        // },
        items: [
          buildBottomNavigationBarItem('홈','home'),
          buildBottomNavigationBarItem('탐색','compass'),
          BottomNavigationBarItem(icon: Padding(
            padding: const EdgeInsets.only(top: 8),
            child: SvgPicture.asset('assets/svg/icons/plus.svg',width: 35),
          ), label: "",
          ),
          buildBottomNavigationBarItem('구독','subs'),
          buildBottomNavigationBarItem('보관함','library'),
        ],
      ),
      ),
    );
  }

  BottomNavigationBarItem buildBottomNavigationBarItem(String iconLable,String iconName) {
    return BottomNavigationBarItem(icon: SvgPicture.asset('assets/svg/icons/${iconName}_off.svg',width: iconSize,),
          activeIcon:SvgPicture.asset('assets/svg/icons/${iconName}_on.svg',width: iconSize), //선택되었을때의 아이콘
          label: iconLable,
        );
  }
}
