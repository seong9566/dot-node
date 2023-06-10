import 'package:dot_node/models/widget_model.dart';
import 'package:dot_node/web_view/components/widget_insert_button.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

/*
 * Project Name:  [DOTnode]
 * Created Date: 2023-04-29
 * Last Modified: 2023-06-10
 * Author: Hyeonseong
 * Modified By: Hyeonseong
 * copyright @ 2023 TeamDOT
 * --- ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---
 *              Description
 * TODO : 
 * 1. 테스트 코드 모두 본코드로 먼저 이관하기
 * 2. TextField를 만들고 서버에 insert 하기
 * 3. Get요청으로 위젯이 불러와지는지 확인하기. (List에 담겨야함.)
 * 800 , 500 데톱 사이즈임 , 데톱은 좌우 여백이 있는데, 모바일
 * screen util 화면의 사이즈를 변수로 관리 해줌
 * --- ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---
 */

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget>? widgetLists;
  @override
  void initState() {
    // 처음 build시에만 아래 3개의 위젯이 만들어짐.
    super.initState();
    widgetLists = <Widget>[
      ContainerWidget(),
      StackWidget(),
      ListWidget(),
    ];
  }

  final FontWeight fWeight = FontWeight.bold;
  final double fTitleSize = 24;
  final double fContentSize = 16;
  final double fHeight = 400;
  final double fWidth = 600;

  @override
  Widget build(BuildContext context) {
    Logger().d("위젯의 길이 확인 : ${widgetLists!.length}");
    return Scaffold(
      appBar: AppBar(
        title: const Text("위젯 바인딩 테스트"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: ListView.builder(
          itemCount: widgetLists!.length + 1,
          itemBuilder: (context, index) {
            if (index == widgetLists!.length) {
              return InsertWidget(
                widgetList: widgetLists,
                onWidgetAdd: () {
                  setState(() {});
                },
              );
            } else {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: widgetLists![index],
              );
            }
          },
        ),
      ),
    );
  }
}
