// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/*
 * Project Name:  [DOTnode]
 * Created Date: 2023-6-10 
 * Last Modified: 2023-08-21
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

// 모든 위젯의 변수들은 전역적으로 관리
const FontWeight fWeight = FontWeight.bold;
const double fTitleSize = 24;
const double fContentSize = 16;
const double fHeight = 400;
const double fWidth = 600;

//ContainerWidget Read Only
// ignore: must_be_immutable
class ContainerWidget extends ConsumerStatefulWidget {
  ContainerWidget({this.titleElement, this.contentElement, Key? key}) : super(key: key);
  String? titleElement;
  String? contentElement;

  @override
  _ContainerWidgetState createState() => _ContainerWidgetState();
}

class _ContainerWidgetState extends ConsumerState<ContainerWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: fWidth,
      color: Colors.amber,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${widget.titleElement}",
              style: TextStyle(fontSize: fTitleSize, fontWeight: fWeight),
            ),
            SizedBox(height: 24),
            Divider(thickness: 1, height: 1, color: Colors.black),
            SizedBox(height: 24),
            Text(
              "${widget.contentElement}",
              style: TextStyle(fontSize: fContentSize),
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
