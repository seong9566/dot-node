import 'package:dot_node/dto/request/widget_insert_req_dto.dart';
import 'package:dot_node/dto/widget_element.dart';
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
 * 위젯 바인딩 Test중 ViewModel역할도 함.
 * 위젯의 데이터를 상태관리로 하기 위해 만든 NotifierProvider이다.
 * 싱글톤으로 List<WidgetElement>를 만드는게 맞을까?
 * 
 * widgetElement를 provider로 관리하는거면 .. 통일성을 위해 나머지도 모두 provider로 하는게 맞지않을까..?
 * --- ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---
 */
final widgetElementProvider =
    StateNotifierProvider<WidgetElementProvider, List<WidgetElement>>(((ref) {
  return WidgetElementProvider()..notifyViewModel();
}));

class WidgetElementProvider extends StateNotifier<List<WidgetElement>> {
  WidgetElementProvider() : super([]); // 빈 list를 넣어서 초기화

  Future<void> notifyViewModel() async {}
  void setTitle(String title) {
    state = [
      ...state ?? [],
      WidgetElement(elementName: 'title', content: title)
    ];
    //widgetElement.add(WidgetElement(elementName: 'title', content: title));
  }

  void setContent(String content) {
    state = [
      ...state ?? [],
      WidgetElement(elementName: 'content', content: content)
    ];
    //widgetElement.add(WidgetElement(elementName: 'content', content: content));
  }
}
