import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class YoutubeDetail extends StatelessWidget {
  Widget _titleZone() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch, //영역을 늘려주면서 왼쪽정렬이됨
        children: [
          Text(
            '개발개발하는 동영상 다시보기',
            style: TextStyle(fontSize: 15),
          ),
          Row(
            children: [
              Text('조회수 1000회',style: TextStyle(fontSize: 13,
                  color: Colors.black.withOpacity(0.5)),),
              Text('・'),
              Text('2021-04-16',style: TextStyle(fontSize: 13,
                  color: Colors.black.withOpacity(0.5)),),

            ],
          ),
        ],
      ),
    );
  }

  Widget _descriptionZone(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 30),
      child: Text(
        '개발하는 남자입니다.개발하는 남자입니다.개발하는 남자입니다.개발하는 남자입니다.'
            '개발하는 남자입니다.개발하는 남자입니다.개발하는 남자입니다.개발하는 남자입니다.'
            '개발하는 남자입니다.개발하는 남자입니다.개발하는 남자입니다.개발하는 남자입니다.'
            '개발하는 남자입니다.',
        style: TextStyle(fontSize: 14),
        maxLines: 4,overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget _buttonOne(String iconPath,String text){
    return Column(
      children: [
        SvgPicture.asset("assets/svg/icons/${iconPath}.svg"),
        Text(text),
      ],
    );
  }
  Widget _buttonZone(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buttonOne('like', "1000"),
        _buttonOne('dislike', "0"),
        _buttonOne('share', "공유"),
        _buttonOne('save', "저장"),
      ],
    );
  }

  Widget _description() {
    //내용이 길어지면 스크롤이 가능하도록 싱글차일드 스크롤뷰로 리턴해줌
    return SingleChildScrollView(
      child: Column(
        children: [
          _titleZone(),
          Divider(indent: 10,endIndent: 10,),
          _descriptionZone(),
          _buttonZone(),
          Divider(indent: 10,endIndent: 10,),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          //상단에 유튜브 플레이어가 들어올 영역을 확보해놓는다.
          Container(
            height: 250,
            color: Colors.grey.withOpacity(0.5),
          ),
          Expanded(
            child: _description(),
          ),
        ],
      ),
    );
  }
}
