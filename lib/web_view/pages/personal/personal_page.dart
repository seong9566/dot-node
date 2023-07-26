import 'package:dot_node/web_view/pages/home/model/widget_element_model.dart';
import 'package:dot_node/web_view/pages/personal/component/insert_container_widget.dart';
import 'package:dot_node/web_view/pages/personal/model/user_widget_view_model.dart';
import 'package:dot_node/widget_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logger/logger.dart';

/*
 * Project Name:  [DOTnode]
 * Created Date: 2023-07-01
 * Last Modified: 2023-07-05
 * Author: Hyeonseong
 * Modified By: Hyeonseong
 * copyright @ 2023 TeamDOT
 * --- ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---
 *              Description
 * 개인 페이지의 위젯 바인딩 테스트 진행 중 
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
  List<Widget> initWidgetList = [ContainerWidget(), ListWidget(), StackWidget()];
  late String _selectedValue;
  List<Widget> widgetModelList = [];

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
                contentWidget,
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    WidgetElementModel? widgetModel = ref.watch(userWidgetViewModel);
    if (widgetModel == null) {
      Logger().d("model이 null입니다.");
      Logger().d("모델 확인 : ${widgetModel?.widgetElementList.length}");
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
              ReorderableListView.builder(
                buildDefaultDragHandles: false,
                shrinkWrap: true, //리스트 자식 높이 크기의 합 만큼으로 영역을 고정 시켜준다.
                physics: ClampingScrollPhysics(),
                itemCount: widgetModel.widgetElementList.length,
                itemBuilder: (context, index) {
                  //1. 위젯으로 만들기
                  for (var data in widgetModel.widgetElementList) {
                    if (data.widgetName == "ContainerWidget") {
                      //2. widgetModel에 추가하기
                      widgetModelList.add(
                        ContainerWidget(
                          titleElement: data.widgetElement[index].content,
                          contentElement: data.widgetElement[index].content,
                        ),
                      );
                    }
                  }
                  final widgetData = widgetModelList[index];
                  return ListTile(
                    key: ValueKey(widgetData),
                    //위젯을 만들어서 title에 줘야함.
                    title: widgetData,
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
                },
                onReorder: (oldIndex, newIndex) {
                  setState(() {
                    if (oldIndex < newIndex) {
                      newIndex--;
                    }
                    final Widget item = initWidgetList.removeAt(oldIndex);
                    initWidgetList.insert(newIndex, item);
                  });
                },
              ),
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
