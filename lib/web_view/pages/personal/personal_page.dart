// ignore_for_file: slash_for_doc_comments

import 'package:dot_node/web_view/pages/home/model/widget_element_model.dart';
import 'package:dot_node/web_view/pages/personal/component/personal_screen_body.dart';
import 'package:dot_node/web_view/pages/personal/model/personal_widget_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logger/logger.dart';

import '../../../constant.dart';
import 'component/personal_app_bar.dart';

/*
 * Project Name:  [DOTnode]
 * Created Date: 2023-07-01
 * Last Modified: 2023-10-30
 * Author: Hyeonseong
 * Modified By: Hyeonseong
 * copyright @ 2023 TeamDOT
 * --- ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---
 *              Description
 * - 위젯의 배치를 사용자가 자유롭게 상 하 로 이동이 가능.
 * 
 * 10.30 : 코드 리펙토링 진행 (컴포넌트화)
 * --- ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---
 */

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

    if (widgetModel == null) {
      Logger().d("model이 null입니다.");
      return Center(child: CircularProgressIndicator());
    } else {
      //  List<String> dropDownButtonItems = <String>["Container", "Stack", "List"];
      return Scaffold(
        appBar: PersonalAppBar(),
        backgroundColor: firstBackGroundColor,
        body: SingleChildScrollView(
          child: PersonalScreenBody(widgetModel: widgetModel),
        ),
      );
    }
  }
}
