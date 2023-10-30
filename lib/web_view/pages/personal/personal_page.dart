// ignore_for_file: slash_for_doc_comments

import 'package:dot_node/web_view/pages/home/model/widget_element_model.dart';
import 'package:dot_node/web_view/pages/personal/component/custom_insert_form_modal.dart';
import 'package:dot_node/web_view/pages/personal/model/personal_widget_view_model.dart';
import 'package:dot_node/models/widget_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logger/logger.dart';

import '../../../controller/widget_controller.dart';
import 'component/personal_app_bar.dart';

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
//2023.09.23 주석처리 : 전부다 Modal창으로 변환
// late String _selectedValue;
//   @override
//   void initState() {
//     super.initState();
//     _selectedValue = 'Container';
//   }
  // void selectedWidget(
  //   BuildContext context,
  //   List<String> dropDownButtonItems,
  //   WidgetController wControl,
  // ) {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) => StatefulBuilder(
  //       builder: (BuildContext context, StateSetter setState) {
  //         Widget contentWidget;
  //         if (_selectedValue == "Container") {
  //           //contentWidget = customInsertFormModal(context: context, wControl: wControl);
  //         } else if (_selectedValue == "Stack") {
  //           contentWidget = StackWidget();
  //         } else {
  //           contentWidget = ListWidget();
  //         }
  //         return AlertDialog(
  //           scrollable: true,
  //           title: const Text('사용할 위젯을 선택하세요.'),
  //           content: Column(
  //             children: [
  //               DropdownButton(
  //                 value: _selectedValue,
  //                 items: dropDownButtonItems.map<DropdownMenuItem<String>>((value) {
  //                   return DropdownMenuItem<String>(
  //                     value: value,
  //                     child: Text(value),
  //                   );
  //                 }).toList(),
  //                 onChanged: (value) {
  //                   setState(() {
  //                     _selectedValue = value!;
  //                     Logger().d("selected : $_selectedValue");
  //                   });
  //                 },
  //               ),
  //               SizedBox(
  //                 height: MediaQuery.of(context).size.height,
  //                 width: MediaQuery.of(context).size.width,
  //                 // child: contentWidget,
  //               )
  //             ],
  //           ),
  //         );
  //       },
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    WidgetElementModel? widgetModel = ref.watch(personalWidgetViewModel);
    WidgetController wController = ref.read(widgetController);
    if (widgetModel == null) {
      Logger().d("model이 null입니다.");
      return Center(child: CircularProgressIndicator());
    } else {
      //  List<String> dropDownButtonItems = <String>["Container", "Stack", "List"];
      return Scaffold(
        appBar: PersonalAppBar(),
        backgroundColor: firstBackGroundColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      //selectedWidget(context, dropDownButtonItems, wController);
                      customInsertFormModal(context: context, wControl: wController);
                    },
                    child: Text("Container 위젯 추가하기"),
                  ),
                ],
              ),
              ReorderableListView.builder(
                buildDefaultDragHandles: false,
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                itemCount: widgetModel.widgetElementList.length, //Element의 갯수만큼
                itemBuilder: (context, index) {
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
              )
            ],
          ),
        ),
      );
    }
  }
}
