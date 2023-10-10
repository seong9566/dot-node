import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:logger/logger.dart';

import '../../../../constant.dart';
import '../../../../controller/widget_controller.dart';
import '../../../../models/session_user.dart';
import '../../../../models/widget_element.dart';
import 'image_field.dart';

Future<Object?> customInsertFormModal({
  required BuildContext context,
  required WidgetController wControl,
}) {
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  //image 변수들
  String imagePath = '';
  final GlobalKey<FormBuilderState> fbKey = GlobalKey<FormBuilderState>();
  List<Widget> formField = [];

  return showGeneralDialog(
    barrierDismissible: true,
    barrierLabel: "insert Widget modal",
    context: context,
    pageBuilder: (context, _, __) {
      // StatefulBuilder를 사용한 이유 : dialog 객체 자체의 state를 가지기 위함과, 사용하지 않았을 시 image 카드 추가 버튼 클릭 시 setState는 부모 위젯에서 실행됌,
      // dialog는 setState가 되지 않는다.
      return StatefulBuilder(
        builder: (context, setState) => Center(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.8,
            margin: const EdgeInsets.symmetric(horizontal: 24),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(
                Radius.circular(40),
              ),
            ),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: Container(
                width: dWidth,
                color: Colors.white70,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                if (formField.isEmpty) {
                                  formField.add(
                                    ImageField(
                                      onImagePathChanged: (path) {
                                        setState(() {
                                          imagePath = path; // imagePath 업데이트
                                          Logger().d("debug 456 $imagePath");
                                        });
                                      },
                                    ),
                                  );
                                } else {
                                  Logger().d("이미지 카드는 한개만 추가가 가능합니다.");
                                }
                                return;
                              });
                            },
                            child: Text("이미지 카드 추가"),
                          ),
                        ],
                      ),
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
                              Row(
                                children: [
                                  FormBuilder(
                                    key: fbKey,
                                    child: formField.isNotEmpty ? Flexible(flex: 4, child: formField[0]) : SizedBox(),
                                  ),
                                  formField.isNotEmpty ? SizedBox(width: 8) : SizedBox(),
                                  Flexible(
                                    flex: 6,
                                    child: Form(
                                      child: Column(
                                        children: [
                                          SizedBox(width: 12),
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
                                            controller: titleController,
                                          ),
                                          TextFormField(
                                            style: TextStyle(fontSize: fContentSize),
                                            maxLines: 5,
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: '내용을 입력하세요.',
                                            ),
                                            controller: contentController,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
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
                              Logger().d("debug 123 imagePath : $imagePath");

                              List<WidgetElement> containerWidget = [
                                WidgetElement(elementName: "title", content: titleController.text),
                                WidgetElement(elementName: "content", content: contentController.text, imageFile: imagePath),
                              ];
                              wControl.insertWidget(
                                  widgetName: "ContainerWidget", userUid: "${SessionUser.user.uid}", widgetElement: containerWidget);
                              Navigator.pop(context);
                            }),
                            child: Text("저장"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    },
  );
}
