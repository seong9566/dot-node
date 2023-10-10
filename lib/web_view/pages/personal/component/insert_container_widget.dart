// // 모든 위젯의 변수들은 전역적으로 관리
// import 'package:dot_node/controller/widget_controller.dart';
// import 'package:dot_node/models/session_user.dart';
// import 'package:dot_node/models/widget_element.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// import 'custom_text_insert_form.dart';

// /*
//  * Project Name:  [DOTnode]
//  * Created Date: 2023-06-17
//  * Last Modified: 2023-09-23
//  * Author: Hyeonseong
//  * Modified By: Hyeonseong
//  * copyright @ 2023 TeamDOT
//  * --- ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---
//  *              Description
//  * 2023.09.23 위젯 추가 선택 자체를 없앴기 때문에 주석처리 됌.
//  * --- ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---
//  */

// // ignore: must_be_immutable
// class InsertContainerWidget extends ConsumerStatefulWidget {
//   InsertContainerWidget({this.titleElement, this.contentElement, Key? key}) : super(key: key);
//   String? titleElement;
//   String? contentElement;

//   @override
//   _InsertContainerWidget createState() => _InsertContainerWidget();
// }

// class _InsertContainerWidget extends ConsumerState<InsertContainerWidget> {
//   TextEditingController titleController = TextEditingController();
//   TextEditingController contentController = TextEditingController();
//   // 2023.09.23 주석처리
//   //  List<Widget> widgetElementList = [];
//   // final List<TextEditingController> _titleControllers = [];
//   // final List<TextEditingController> _contentControllers = [];
//   // void addTextInsertForm() {
//   //   TextEditingController titleController = TextEditingController();
//   //   TextEditingController contentController = TextEditingController();
//   //   _titleControllers.add(titleController);
//   //   _contentControllers.add(contentController);
//   //   widgetElementList.add(TextInsertForm(title: titleController, content: contentController));
//   // }

//   @override
//   void initState() {
//     // 최초의 한개의 InsertForm
//     // addTextInsertForm();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final wControl = ref.read(widgetController);
//     return SizedBox(
//       child: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               Column(
//                 children: [
//                   TextInsertForm(titleController: titleController, contentController: contentController),
//                 ],
//               ),
//               Row(
//                 children: [
//                   insertBtn(wControl, context),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//   // 2023.09.23 주석처리
//   // TextButton elementCreateBtn({required VoidCallback press}) {
//   //   return TextButton(
//   //     onPressed: press,
//   //     child: Text("위젯 요소 추가 버튼"),
//   //   );
//   // }

//   TextButton insertBtn(WidgetController wControl, BuildContext context) {
//     return TextButton(
//       onPressed: (() {
//         // 2023.09.23 주석처리
//         //  List<WidgetElement> containerWidgets = [];
//         //  for (int i = 0; i < widgetElementList.length; i++) {
//         //   String title = _titleControllers[i].text;
//         //   String content = _contentControllers[i].text;
//         //   containerWidgets.add(WidgetElement(elementName: "title", content: title));
//         //   containerWidgets.add(WidgetElement(elementName: "content", content: content));
//         // }
//         List<WidgetElement> containerWidget = [
//           WidgetElement(elementName: "title", content: titleController.text),
//           WidgetElement(elementName: "content", content: contentController.text),
//         ];
//         wControl.insertWidget(widgetName: "ContainerWidget", userUid: "${SessionUser.user.uid}", widgetElement: containerWidget);
//         Navigator.pop(context);
//       }),
//       child: Text("저장"),
//     );
//   }
// }
