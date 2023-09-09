// 모든 위젯의 변수들은 전역적으로 관리
import 'package:dot_node/controller/widget_controller.dart';
import 'package:dot_node/models/session_user.dart';
import 'package:dot_node/models/widget_element.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

/*
 * Project Name:  [DOTnode]
 * Created Date: 2023-06-17
 * Last Modified: 2023-09-09
 * Author: Hyeonseong
 * Modified By: Hyeonseong
 * copyright @ 2023 TeamDOT
 * --- ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---
 *              Description
 * Insert 할 때와 View위젯을 분리
 * 입력가능한 Container 위젯
 * 위젯의 요소 추가/제거/수정 해야함.
 * --- ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---
 */

const FontWeight fWeight = FontWeight.bold;
const double fTitleSize = 24;
const double fContentSize = 16;
const double fHeight = 400;
const double fWidth = 600;

// ignore: must_be_immutable
class InsertContainerWidget extends ConsumerStatefulWidget {
  InsertContainerWidget({this.titleElement, this.contentElement, Key? key}) : super(key: key);
  String? titleElement;
  String? contentElement;

  @override
  _InsertContainerWidget createState() => _InsertContainerWidget();
}

class _InsertContainerWidget extends ConsumerState<InsertContainerWidget> {
  List<Widget> widgetElementList = [];
  final List<TextEditingController> _titleControllers = [];
  final List<TextEditingController> _contentControllers = [];

  void addTextInsertForm() {
    TextEditingController titleController = TextEditingController();
    TextEditingController contentController = TextEditingController();
    _titleControllers.add(titleController);
    _contentControllers.add(contentController);
    widgetElementList.add(TextInsertForm(title: titleController, content: contentController));
  }

  @override
  void initState() {
    // 최초의 한개의 InsertForm
    addTextInsertForm();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final wControl = ref.read(widgetController);
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: widgetElementList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return widgetElementList[index];
                    },
                  )
                ],
              ),
              Row(
                children: [
                  insertBtn(wControl, context),
                  elementCreateBtn(
                    press: () {
                      setState(() {
                        addTextInsertForm();
                        Logger().d("리스트 추가? ${widgetElementList.length}");
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextButton elementCreateBtn({required VoidCallback press}) {
    return TextButton(
      onPressed: press,
      child: Text("위젯 요소 추가 버튼"),
    );
  }

  TextButton insertBtn(WidgetController wControl, BuildContext context) {
    return TextButton(
      onPressed: (() {
        List<WidgetElement> containerWidgets = [];
        for (int i = 0; i < widgetElementList.length; i++) {
          String title = _titleControllers[i].text;
          String content = _contentControllers[i].text;
          containerWidgets.add(WidgetElement(elementName: "title", content: title));
          containerWidgets.add(WidgetElement(elementName: "content", content: content));
        }
        // List<WidgetElement> containerWidget = [
        //   WidgetElement(elementName: "title", content: _title.text),
        //   WidgetElement(elementName: "content", content: _content.text),
        // ];
        wControl.insertWidget(widgetName: "ContainerWidget", userUid: "${SessionUser.user.uid}", widgetElement: containerWidgets);
        Navigator.pop(context);
      }),
      child: Text("저장"),
    );
  }
}

class TextInsertForm extends StatelessWidget {
  const TextInsertForm({
    super.key,
    required TextEditingController title,
    required TextEditingController content,
  })  : _title = title,
        _content = content;

  final TextEditingController _title;
  final TextEditingController _content;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 16),
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
              width: 0.3,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Form(
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
          ),
        ),
      ],
    );
  }
}
