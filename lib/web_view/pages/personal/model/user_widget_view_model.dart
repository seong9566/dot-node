import 'package:dot_node/dto/response_dto.dart';
import 'package:dot_node/service/widget_service.dart';
import 'package:dot_node/web_view/pages/home/model/widget_element_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/*
 * Project Name:  [DOTnode]
 * Created Date: 2023-6-17 
 * Last Modified: 2023-06-17
 * Author: Hyeonseong
 * Modified By: Hyeonseong
 * copyright @ 2023 TeamDOT
 * --- ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---
 *              Description
 * User가 사용중인 Widget의 리스트 ViewModel
 * --- ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---
 */

final userWidgetViewModel = StateNotifierProvider<UserWidgetViewModel, WidgetElementModel?>((ref) {
  return UserWidgetViewModel(null, ref)..notifyViewModel();
});

String testToken =
    "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhdXRoIiwicm9sZSI6IlVTRVIiLCJleHAiOjE2OTAxOTE3MjIsInVzZXJVaWQiOiJ5b3VuZ21pbiJ9.qAF-sSNHaOqiFliZQ94f4NMrJhoBEw2T07wIDkQYCYE";

class UserWidgetViewModel extends StateNotifier<WidgetElementModel?> {
  final WidgetService widgetService = WidgetService();
  UserWidgetViewModel(super.state, this.ref);
  final Ref ref;

  Future<void> notifyViewModel() async {
    String userName = "youngmin";
    ResponseDto responseDto = await widgetService.fetchGetWidget(userName: userName, jwtToken: testToken);
    state = WidgetElementModel(responseDto.data);
  }
}
