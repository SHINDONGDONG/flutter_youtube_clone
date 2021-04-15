import 'package:flutter/material.dart';
import 'package:flutter_youtube/src/components/custom_appbar.dart';
import 'package:flutter_youtube/src/components/video_widget.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      //Sliver 사용할때는 스크롤 뷰로 먼저 선언
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            //슬리버는 액션이 나오는 앱바이기때문에 기본적으로 스크롤업
            //하면 앱바가 사라지는 액션이옴
            //컨테이너로 영역을 지정해줘야함.
            title: CustomAppBar(),
            floating: true, //앱스크롤을 밑으로 내리면 다시 앱바가 생김
            snap: true,
          ),
          SliverList(
            //Deletage는 슬리버 차일드빌드 델리게이트에
            //리턴값이 실제 리스트들이 된다.
            delegate: SliverChildBuilderDelegate(
                (context,index){
                  return GestureDetector(
                    child: VideoWidget(),
                    //클릭시 Route이동
                    onTap: (){
                      //Gettonamed로 보내지만 임의로 아이디를 보냄
                      Get.toNamed("/detail/827393");
                    },
                  );
                },
              childCount: 10, //리스트의 수
            ),
          ),
        ],
      ),
    );
  }
}
