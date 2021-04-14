import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class YoutubeBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(       //bottomsheet 가 밑에서 나오는 컨테이너의 위를 깎아준다 20씩
      borderRadius:BorderRadius.only(topLeft:Radius.circular(20),topRight: Radius.circular(20)),
      child: Container(
        padding: EdgeInsets.only(left: 15,bottom: 15),
        height: Get.height/3.65,
        color: Colors.white,
        child: Column(
          children: [
           header(),
            SizedBox(height: 10,),
            WidgetItemButton(svgPicName: 'upload',label: '動画のアップロード',onTap: ()=>print('동영상업로드'),iconSize: 17),
            SizedBox(height: 20,),
            WidgetItemButton(svgPicName: 'broadcast',label: 'ライブストリーミング',onTap: ()=>print('스트리밍 시작기능'),iconSize: 25),
          ],
        ),
      ),
    );
  }

  Widget header() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('作成'),
        IconButton(icon: Icon(Icons.close), onPressed: ()=>Get.back()),
      ],
    );
  }

  Widget WidgetItemButton({String svgPicName,String label,Function onTap,double iconSize}) {
    return GestureDetector(
            onTap: onTap,
            child: Row(
              children: [
                Center(
                  child: Container(
                    child: SvgPicture.asset("assets/svg/icons/${svgPicName}.svg"),
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.only(right: 15),
                    width: 40,
                    height: 40,
                    //컨테이너를 둥글게 만들어준다
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey.withOpacity(0.3),
                    ),
                  ),
                ),
                Text(label),
              ],
            ),
          );
  }


}
