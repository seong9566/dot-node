import 'package:dot_node/dto/response/widget_get_resp_dto.dart';
import 'package:dot_node/dto/response_dto.dart';
import 'package:dot_node/service/widget_service.dart';
import 'package:dot_node/web_view/pages/home/model/widget_element_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

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

final userWidgetViewModel =
    StateNotifierProvider<UserWidgetViewModel, WidgetElementModel?>((ref) {
  return UserWidgetViewModel(null)..notifyViewModel();
});

class UserWidgetViewModel extends StateNotifier<WidgetElementModel?> {
  final WidgetService widgetService = WidgetService();
  UserWidgetViewModel(super.state);

  Future<void> notifyViewModel() async {
    String userName = "youngmin";
    ResponseDto responseDto =
        await widgetService.fetchGetWidget(userName: userName);
    state = WidgetElementModel(responseDto.data);
  }
}
