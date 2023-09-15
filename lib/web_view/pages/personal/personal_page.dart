// ignore_for_file: slash_for_doc_comments

import 'package:dot_node/web_view/pages/home/model/widget_element_model.dart';
import 'package:dot_node/web_view/pages/personal/component/insert_container_widget.dart';
import 'package:dot_node/web_view/pages/personal/model/personal_widget_view_model.dart';
import 'package:dot_node/widget_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logger/logger.dart';

/*
 * Project Name:  [DOTnode]
 * Created Date: 2023-07-01
 * Last Modified: 2023-09-09
 * Author: Hyeonseong
 * Modified By: Hyeonseong
 * copyright @ 2023 TeamDOT
 * --- ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---
 *              Description
 * - 위젯의 배치를 사용자가 자유롭게 상 하 로 이동이 가능.
 * --- ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---
 */
final firstBackGroundColor = Colors.grey.shade800;
final secondBackGroundColor = Colors.grey.shade900;
final textStyle = TextStyle(fontSize: 12.sp, color: Colors.white);
final appBarText = TextStyle(fontSize: 12.sp, color: Colors.white38);

class PersonalPage extends ConsumerStatefulWidget {
  PersonalPage({Key? key}) : super(key: key);
  @override
  ConsumerState<PersonalPage> createState() => _PersonalPageState();
}

class _PersonalPageState extends ConsumerState<PersonalPage> {
  late String _selectedValue;

  @override
  void initState() {
    super.initState();
    _selectedValue = 'Container';
  }

  void selectedWidget(BuildContext context, List<String> dropDownButtonItems) {
    showDialog(
      context: context,
      builder: (BuildContext context) => StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          Widget contentWidget;
          if (_selectedValue == "Container") {
            contentWidget = InsertContainerWidget();
          } else if (_selectedValue == "Stack") {
            contentWidget = StackWidget();
          } else {
            contentWidget = ListWidget();
          }
          return AlertDialog(
            scrollable: true,
            title: const Text('사용할 위젯을 선택하세요.'),
            content: Column(
              children: [
                DropdownButton(
                  value: _selectedValue,
                  items: dropDownButtonItems.map<DropdownMenuItem<String>>((value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedValue = value!;
                      Logger().d("selected : $_selectedValue");
                    });
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: contentWidget,
                )
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    WidgetElementModel? widgetModel = ref.watch(personalWidgetViewModel);
    if (widgetModel == null) {
      Logger().d("model이 null입니다.");
      return Center(child: CircularProgressIndicator());
    } else {
      List<String> dropDownButtonItems = <String>["Container", "Stack", "List"];
      return Scaffold(
        appBar: PersonalAppBar(),
        backgroundColor: firstBackGroundColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  selectedWidget(context, dropDownButtonItems);
                },
                child: Text("위젯 추가하기"),
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: widgetModel.widgetElementList.length, //Widget의 갯수만큼
                itemBuilder: (context, parentIndex) {
                  Logger().d("Widget의 갯수 : ${widgetModel.widgetElementList.length}");
                  final parentItem = widgetModel.widgetElementList[parentIndex];
                  Logger().d("parentItem = ${parentItem.widgetElement.length ~/ 2}"); // 10개
                  return ReorderableListView.builder(
                    buildDefaultDragHandles: false,
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemCount: parentItem.widgetElement.length ~/ 2, //Element의 갯수만큼
                    itemBuilder: (context, index) {
                      Logger().d("Element의 갯수 : ${parentItem.widgetElement.length}");
                      final data = widgetModel.widgetElementList[index];
                      if (data.widgetName == "ContainerWidget") {
                        return ListTile(
                          key: ValueKey(data), // 각 위젯의 고유한 Key를 사용
                          title: ContainerWidget(
                            model: data,
                          ),
                          leading: ReorderableDragStartListener(
                            index: index,
                            child: Icon(
                              Icons.drag_handle,
                              color: Colors.white,
                            ),
                          ),
                          tileColor: firstBackGroundColor,
                          shape: RoundedRectangleBorder(
                            side: BorderSide.none,
                          ),
                        );
                      }
                      // "ContainerWidget"가 아닌 경우 빈 위젯을 반환하거나 다른 위젯을 사용
                      return SizedBox.shrink();
                    },
                    onReorder: (oldIndex, newIndex) {
                      setState(() {
                        if (oldIndex < newIndex) {
                          newIndex--;
                        }
                        final item = widgetModel.widgetElementList.removeAt(oldIndex);
                        widgetModel.widgetElementList.insert(newIndex, item);
                      });
                    },
                  );
                  return null;
                },
              )
            ],
          ),
        ),
      );
    }
  }
}

class PersonalAppBar extends StatelessWidget implements PreferredSizeWidget {
  const PersonalAppBar({Key? key}) : super(key: key);
  @override
  Size get preferredSize => Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0).w,
      child: SizedBox(
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 70.w,
              height: 70.h,
              child: InkWell(
                child: Image.asset(
                  "assets/metalogo.png",
                  fit: BoxFit.contain,
                ),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'MAIN',
                style: appBarText,
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'PROFILE',
                style: appBarText,
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'WORKS',
                style: appBarText,
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'CONTACT',
                style: appBarText,
              ),
            ),
            SizedBox(width: 1200.w),
            Stack(
              alignment: Alignment.centerRight,
              children: [
                Positioned(
                  child: Transform.scale(
                    scale: 1.0,
                    child: Transform.translate(
                      offset: Offset(0, 0),
                      child: Icon(
                        Icons.apple_rounded,
                        size: 50,
                        color: Color.fromRGBO(110, 110, 110, 110),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  child: Text(
                    "INDUSTRIAL DESIGNER",
                    style: textStyle,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class DumyWidget {
/**
 * {
                "widgetId": 1,
                "widgetName": "widget sample",
                "widgetElement": []
            },
            {
                "widgetId": 2,
                "widgetName": "ContainerWidget",
                "widgetElement": [
                    {
                        "elementId": 4,
                        "elementName": "title",
                        "content": "12",
                        "imageId": null,
                        "imageFile": null
                    },
                    {
                        "elementId": 5,
                        "elementName": "content",
                        "content": "34",
                        "imageId": null,
                        "imageFile": null
                    }
                ]
            }
 */

  final int widgetId;
  final String widgetName;
  final List<DumyElement> widgetElement;

  DumyWidget({
    required this.widgetId,
    required this.widgetName,
    required this.widgetElement,
  });
}

class DumyElement {
  // {
  //                   {
  //                       "elementId": 4,
  //                       "elementName": "title",
  //                       "content": "12",
  //                       "imageId": null,
  //                       "imageFile": null
  //                   },
  //                   {
  //                       "elementId": 5,
  //                       "elementName": "content",
  //                       "content": "34",
  //                       "imageId": null,
  //                       "imageFile": null
  //                   }
  //               ]
  //           }
  final int elementId;
  final String elementName;
  final String content;
  final int imageId;
  final String imageFile;

  DumyElement({
    required this.elementId,
    required this.elementName,
    required this.content,
    required this.imageId,
    required this.imageFile,
  });
}
