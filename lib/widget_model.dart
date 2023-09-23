// ignore_for_file: prefer_const_constructors

import 'package:dot_node/controller/widget_controller.dart';
import 'package:dot_node/dto/response/widget_get_resp_dto.dart';
import 'package:dot_node/models/session_user.dart';
import 'package:dot_node/web_view/pages/personal/component/image_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

import 'constant.dart';
import 'models/widget_element.dart';

/*
 * Project Name:  [DOTnode]
 * Created Date: 2023-6-10 
 * Last Modified: 2023-08-24
 * Author: Hyeonseong
 * Modified By: Hyeonseong
 * copyright @ 2023 TeamDOT
 * --- ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---
 *              Description
 * 
 * 위젯의 형태 정의
 * 
 * 위젯의 기본틀은 갖춰져있음, Title,Text,img는 서버에서 가지고 와서 바인딩
 * --- ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---
 */

//ContainerWidget Read Only
// ignore: must_be_immutable
class ContainerWidget extends ConsumerStatefulWidget {
  ContainerWidget({this.model, Key? key}) : super(key: key);

  WidgetGetRespDto? model;

  @override
  _ContainerWidgetState createState() => _ContainerWidgetState();
}

class _ContainerWidgetState extends ConsumerState<ContainerWidget> {
  TextEditingController _title = TextEditingController();
  TextEditingController _content = TextEditingController();
  String imagePath = '';
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
    Logger().d("debug22 ${widget.model!.widgetElement[1].imageFile}");
    final GlobalKey<FormBuilderState> fbKey = GlobalKey<FormBuilderState>();
    List<Widget> formField = [];

    return GestureDetector(
      onTap: () {
        showGeneralDialog(
          barrierDismissible: true,
          barrierLabel: "detail modal",
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
                                    Logger().d("imagePath : $imagePath");

                                    List<WidgetElement> containerWidget = [
                                      WidgetElement(elementId: widget.model!.widgetElement[0].elementId, elementName: "title", content: _title.text),
                                      WidgetElement(
                                          elementId: widget.model!.widgetElement[1].elementId,
                                          elementName: "content",
                                          content: _content.text,
                                          imageFile: imagePath),
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
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
      child: Container(
        width: fWidth,
        color: Colors.white70,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.model!.widgetElement[0].content,
                style: TextStyle(fontSize: fTitleSize, fontWeight: fWeight),
              ),
              SizedBox(height: 24),
              Divider(thickness: 1, height: 1, color: Colors.black),
              SizedBox(height: 24),
              if (widget.model!.widgetElement[1].imageFile != null) Image.network(widget.model!.widgetElement[1].imageFile!),
              Text(
                widget.model!.widgetElement[1].content,
                style: TextStyle(fontSize: fContentSize),
              ),
              Row(
                children: [
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
      ),
    );
  }
}

class StackWidget extends StatefulWidget {
  const StackWidget({super.key});

  @override
  State<StackWidget> createState() => _StackWidgetState();
}

class _StackWidgetState extends State<StackWidget> {
  // 나중에 Provider 사용시 필요 setState가 필요 없어짐, 상태값은 Provider로 관리 함.

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: fWidth,
          height: fHeight,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Image.asset(
                  "assets/profile.jpeg",
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 32),
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "홍길동",
                      style: TextStyle(fontSize: fTitleSize),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "조선대학교, 정보공학과",
                      style: TextStyle(fontSize: fContentSize),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        // Positioned(
        //   bottom: 16,
        //   child: ListWidget(),
        // ),
      ],
    );
  }
}

class ListWidget extends StatefulWidget {
  const ListWidget({super.key});

  @override
  State<ListWidget> createState() => _ListWidgetState();
}

class _ListWidgetState extends State<ListWidget> {
  //final List<String> listCardImages = [];
  Map<String, List<String>> listCardItems = {
    "title": ["test1", "test2", "test3"],
    "img": ["assets/image1.jpeg", "assets/image2.jpeg", "assets/image3.jpeg"],
  };

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // 변수화
      width: fWidth, // 리스트 뷰의 크기
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                SizedBox(
                  // 사진의 크기
                  width: 150,
                  height: 200,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      listCardItems["img"]![index].toString(),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  child: Text(
                    //listCardImages[index].text,
                    listCardItems["title"]![index].toString(),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
