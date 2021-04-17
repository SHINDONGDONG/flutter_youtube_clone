import 'package:flutter/material.dart';
import 'package:flutter_youtube/src/models/video.dart';
import 'package:intl/intl.dart';
class VideoWidget extends StatelessWidget {
  final Video video;

  const VideoWidget({Key key, this.video}) : super(key: key);

  Widget _thumbnail() {
    return Container(
      //이미지를 네트워크로 가져와 (video.snippet.thumbnails 섬네일 url 중간사이즈)
      child: Image.network(video.snippet.thumbnails.medium.url,fit: BoxFit.fitWidth,),
      height: 250,
      color: Colors.grey.withOpacity(0.5),
    );
  }

  Widget _simpleDetailinfo() {
    return Padding(
      padding: const EdgeInsets.only(left: 10,bottom: 20),
      child: Container(
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: Image.network(
                      "https://yt3.ggpht.com/ytc/AAUvwniU0ZOGv47lDdGSQ8H004fQgwOAJRlobuCvXwNl=s48-c-k-c0x00ffffff-no-rj")
                  .image,
              backgroundColor: Colors.grey.withOpacity(0.5),
            ),
            SizedBox(width: 10,),
            //서클아바타 이외의 부분을 익스텐드로 확장하여 더 자유롭게 사용이 가능하게 함
            Expanded(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //Expanded로 영역을 지정해주어 자동으로 줄바꿈이 되도록함.
                      Expanded(
                        child: Text('${video.snippet.title}',
                        maxLines: 2,overflow: TextOverflow.ellipsis,),
                        //줄이 아무리 길어도 2줄만 나오도록 만들고
                      ),
                      //타이틀과 더보기 버튼을 바로 옆에 배치하기위하여
                      IconButton(
                        // 텍스트가 두줄이 됨으로써 alignment가 정렬이 이상하게되지만
                        //얼라이먼트 탑센터로 지정해주면 된다!
                        alignment: Alignment.topCenter,
                        icon: Icon(
                          Icons.more_vert,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(video.snippet.channelTitle,style: TextStyle(fontSize: 12,color: Colors.black.withOpacity(0.8)),),
                      Text('・'),
                      Text('조회수 1000회',style: TextStyle(fontSize: 12,color: Colors.black.withOpacity(0.6)),),
                      Text('・'),
                      Text(
                        DateFormat("yyyy-MM-dd").format(video.snippet.publishedAt) ,style: TextStyle(fontSize: 12,color: Colors.black.withOpacity(0.6)),),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _thumbnail(), //섬네일 이미지의 위젯
        _simpleDetailinfo(), //디테일 정보를 보여주는 위젯
      ],
    );
  }
}
