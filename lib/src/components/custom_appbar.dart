import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends StatelessWidget {


  Widget _logo(){
    return Container(
      child: Image.asset("assets/images/logo.png"),
      width: 130,
    );
  }

  Widget _actions(){
    return Row(
      children: [
        GestureDetector(
          onTap: () {},
          child: Container(
            width: 30,
            height: 30,
            child: SvgPicture.asset("assets/svg/icons/bell.svg"),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: GestureDetector(
            onTap: () {},
            child: Container(
              width: 30,
              height: 30,
              child: SvgPicture.asset("assets/svg/icons/search.svg"),
            ),
          ),
        ),
        CircleAvatar(
          backgroundColor: Colors.grey.withOpacity(0.5),
          //Iamge.netwrok에서 마지막에 .image를 삽입하면 프로바이더를 사용하는것이됨
          backgroundImage: Image.network(
              "https://yt3.ggpht.com/ytc/AAUvwniU0ZOGv47lDdGSQ8H004fQgwOAJRlobuCvXwNl=s48-c-k-c0x00ffffff-no-rj")
              .image,
        ),
      ],
    );
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //개남 로고랑, 액션스의 스페이스 비트윈을 하기위하여 Row로 다시 묶어주고
        //따로 빼놓은것!!
        children: [
          _logo(),
          _actions(),
        ],
      ),
    );
  }
}
