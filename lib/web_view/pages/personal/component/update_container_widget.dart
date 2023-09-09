// 모든 위젯의 변수들은 전역적으로 관리
import 'package:dot_node/controller/widget_controller.dart';
import 'package:dot_node/dto/response/widget_get_resp_dto.dart';
import 'package:dot_node/models/widget_element.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

import '../../../../models/session_user.dart';

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

// ignore: must_be_immutable
class UpdateContainerWidget extends ConsumerStatefulWidget {
  UpdateContainerWidget({this.model, Key? key}) : super(key: key);
  WidgetGetRespDto? model;
  @override
  _UpdateContainerWidget createState() => _UpdateContainerWidget();
}

class _UpdateContainerWidget extends ConsumerState<UpdateContainerWidget> {
  TextEditingController _title = TextEditingController();
  TextEditingController _content = TextEditingController();

  @override
  void initState() {
    super.initState();
    _title = TextEditingController(text: widget.model!.widgetElement[0].content);
    _content = TextEditingController(text: widget.model!.widgetElement[1].content);
  }

  @override
  void dispose() {
    _title.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const FontWeight fWeight = FontWeight.bold;
    const double fTitleSize = 24;
    const double fContentSize = 16;
    double fWidth = MediaQuery.of(context).size.width;
    final wControl = ref.read(widgetController);

    Logger().d("model이 null? ${widget.model}");

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
                  WidgetElement(elementId: widget.model!.widgetElement[0].elementId, elementName: "title", content: _title.text),
                  WidgetElement(elementId: widget.model!.widgetElement[1].elementId, elementName: "content", content: _content.text),
                ];
                wControl.updateWidget(
                    widgetId: widget.model!.widgetId,
                    widgetName: "ContainerWidget",
                    userUid: "${SessionUser.user.uid}",
                    widgetElement: containerWidget);
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
