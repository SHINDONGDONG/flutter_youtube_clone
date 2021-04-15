import 'package:flutter/material.dart';
import 'package:flutter_youtube/src/app.dart';
import 'package:flutter_youtube/src/binding/init_binding.dart';
import 'package:flutter_youtube/src/components/youtube_detail.dart';
import 'package:flutter_youtube/src/pages/explore.dart';
import 'package:flutter_youtube/src/pages/home.dart';
import 'package:flutter_youtube/src/pages/library.dart';
import 'package:flutter_youtube/src/pages/subs.dart';
import 'package:get/get.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(      //GetX를 사용하기 때문에 GetMaterial
      title: 'Youtube CloneApp',
      theme: ThemeData(
        primaryColor: Colors.white,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      
      initialBinding: InitBinding(), //초기에 바인딩할 컨트롤러  현재 페이지가 총괄페이지라 바인딩해주면 모든 페이지에적용됨
      initialRoute: "/", //초기에 이동할 페이지를 설정 인잇탈라우트
      getPages: [
        //겟페이지에서 "/" 로 이동하면 App Page로 이동하게됨
        GetPage(name: "/", page: ()=>App()),
        GetPage(name: "/Home", page: ()=>Home()),
        GetPage(name: "/Explore", page: ()=>Explore()),
        GetPage(name: "/Subs", page: ()=>Subs()),
        GetPage(name: "/Labrary", page: ()=>Labrary()),
        GetPage(name: "/detail/:videoId", page: ()=>YoutubeDetail()),
                    //detail 페이지로 넘길 때 videoId도 같이 넘겨줌 :videoId
      ],
      );
  }
}
