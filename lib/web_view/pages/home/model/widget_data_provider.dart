import 'package:dot_node/models/widget_element.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/*
 * Project Name:  [DOTnode]
 * Created Date: 2023-6-10 
 * Last Modified: 2023-06-17
 * Author: Hyeonseong
 * Modified By: Hyeonseong
 * copyright @ 2023 TeamDOT
 * --- ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---
 *              Description
 * 위젯의 데이터를 상태관리로 하기 위해 만든 NotifierProvider이다.
 * 해당 Provider의 state는 insert할 경우에만 사용. 
 * 
 * --- ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---
 */
// final widgetDataProvider = StateNotifierProvider<WidgetDataProvider, List<WidgetElement>>(((ref) {
//   return WidgetDataProvider();
// }));

// class WidgetDataProvider extends StateNotifier<List<WidgetElement>> {
//   WidgetDataProvider() : super([]); // 빈 list를 넣어서 초기화

//   void setTitle(String title) {
//     state = [...state, WidgetElement(elementName: 'title', content: title)];
//   }

//   void setContent(String content) {
//     state = [...state, WidgetElement(elementName: 'content', content: content)];
//   }
// }
