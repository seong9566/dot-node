// ignore_for_file: prefer_const_constructors

import 'package:dot_node/dto/request/widget_insert_req_dto.dart';
import 'package:dot_node/models/widget/widget_element_provider.dart';
import 'package:dot_node/web_view/components/container_insert_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/*
 * Project Name:  [DOTnode]
 * Created Date: 2023-6-10 
 * Last Modified: 2023-06-10
 * Author: Hyeonseong
 * Modified By: Hyeonseong
 * copyright @ 2023 TeamDOT
 * --- ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---
 *              Description
 * 
 * 위젯의 형태 정의
 * 
 * 위젯의 기본틀은 갖춰져있음, Title,Text,img는 서버에서 가지고 와서 바인딩
 * 1. Container위젯에서 데이터를 만들기
 * 2. widgetInsertButton에서는 만들어진 ContainerWidget의 데이터를 받아서 post만 하도록 만들기. 
 * --- ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---
 */

// 모든 위젯의 변수들은 전역적으로 관리
const FontWeight fWeight = FontWeight.bold;
const double fTitleSize = 24;
const double fContentSize = 16;
const double fHeight = 400;
const double fWidth = 600;

class ContainerWidget extends ConsumerStatefulWidget {
  ContainerWidget({this.titleElement, this.contentElement, Key? key})
      : super(key: key);
  final String? titleElement;
  final String? contentElement;
  @override
  _ContainerWidgetState createState() => _ContainerWidgetState();
}

class _ContainerWidgetState extends ConsumerState<ContainerWidget> {
  final _title = TextEditingController();
  final _content = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final eContorl = ref.watch(widgetElementProvider.notifier);
    return Container(
      width: fWidth,
      color: Colors.amber,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Visibility(
              visible:
                  widget.titleElement == null && widget.contentElement == null,
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
            Visibility(
              visible:
                  widget.titleElement != null && widget.contentElement != null,
              child: Column(
                children: [
                  Text(widget.titleElement ?? ''),
                  Text(widget.contentElement ?? ''),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: (() {
                eContorl.setTitle(_title.text);
                eContorl.setContent(_content.text);
              }),
              child: Text("추가"),
            ),
          ],
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
