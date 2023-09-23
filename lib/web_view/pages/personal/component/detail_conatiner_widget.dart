import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constant.dart';
import '../../../../controller/widget_controller.dart';
import '../../../../dto/response/widget_get_resp_dto.dart';
import '../../../../models/session_user.dart';
import '../../../../models/widget_element.dart';

class DetailContainerWidget extends ConsumerStatefulWidget {
  DetailContainerWidget({this.model, Key? key}) : super(key: key);

  WidgetGetRespDto? model;

  @override
  _DetailContainerWidgetState createState() => _DetailContainerWidgetState();
}

class _DetailContainerWidgetState extends ConsumerState<DetailContainerWidget> {
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
    _title = TextEditingController(text: widget.model!.widgetElement[0].content);
    _content = TextEditingController(text: widget.model!.widgetElement[1].content);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final wControl = ref.read(widgetController);

    return Container(
      width: dWidth,
      color: Colors.white70,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade400,
                borderRadius: BorderRadius.all(
                  Radius.circular(16),
                ),
              ),
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
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                ElevatedButton(
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
                SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    wControl.deleteWidget(widgetId: widget.model!.widgetId, userUid: "${SessionUser.user.uid}");
                  },
                  child: Text("삭제"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
