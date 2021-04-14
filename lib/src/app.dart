import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_youtube/controller/app_controller.dart';
import 'package:get/get.dart';

//가장 루트경로가 되는 페이지
class App extends GetView<AppController> { //Getview에 Appcontroller를 넣어줌으로써 컨트롤러를 무조건 사용가능
  double iconSize = 22.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AppTitle'),
      ),                   //Obx로 유연한 상태관리 적용
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
      body: SafeArea(
        child: Container(),
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
