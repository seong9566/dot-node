// 모든 위젯의 변수들은 전역적으로 관리
import 'package:dot_node/controller/widget_controller.dart';
import 'package:dot_node/models/widget_element.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/*
 * Project Name:  [DOTnode]
 * Created Date: 2023-06-17
 * Last Modified: 2023-08-21
 * Author: Hyeonseong
 * Modified By: Hyeonseong
 * copyright @ 2023 TeamDOT
 * --- ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---
 *              Description
 * Insert 할 때와 View위젯을 분리
 * 입력가능한 Container 위젯
 * --- ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---
 */

const FontWeight fWeight = FontWeight.bold;
const double fTitleSize = 24;
const double fContentSize = 16;
const double fHeight = 400;
const double fWidth = 600;

// ignore: must_be_immutable
class UpdateContainerWidget extends ConsumerStatefulWidget {
  UpdateContainerWidget({this.titleElement, this.contentElement, Key? key}) : super(key: key);
  String? titleElement;
  String? contentElement;

  @override
  _UpdateContainerWidget createState() => _UpdateContainerWidget();
}

class _UpdateContainerWidget extends ConsumerState<UpdateContainerWidget> {
  final _title = TextEditingController();
  final _content = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final wControl = ref.read(widgetController);
    return Container(
      width: fWidth,
      color: Colors.amber,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Form(
              child: Column(
                children: [
                  TextFormField(
                    style: TextStyle(
                      fontSize: fTitleSize,
                      fontWeight: fWeight,
                    ),
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: 0.1,
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: 0.1,
                        ),
                      ),
                      hintText: '제목을 입력하세요',
                    ),
                    controller: _title,
                  ),
                  TextFormField(
                    style: TextStyle(fontSize: fContentSize),
                    maxLines: 5,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: '내용을 입력하세요.',
                    ),
                    controller: _content,
                  ),
                ],
              ),
            ),
            TextButton(
              onPressed: (() {
                List<WidgetElement> containerWidget = [
                  WidgetElement(elementName: "title", content: _title.text),
                  WidgetElement(elementName: "content", content: _content.text),
                ];
                wControl.insertWidget(widgetName: "ContainerWidget", userUid: "이현성", widgetElement: containerWidget);
                Navigator.pop(context);
              }),
              child: Text("저장"),
            ),
          ],
        ),
      ),
    );
  }
}
