import 'package:dot_node/dto/response_dto.dart';
import 'package:dot_node/service/auth_service.dart';
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

final userWidgetViewModel = StateNotifierProvider<UserWidgetViewModel, WidgetElementModel?>((ref) {
  return UserWidgetViewModel(null, ref)..notifyViewModel();
});

class UserWidgetViewModel extends StateNotifier<WidgetElementModel?> {
  final WidgetService widgetService = WidgetService();
  UserWidgetViewModel(super.state, this.ref);
  final Ref ref;

  Future<void> notifyViewModel() async {
    String userName = "youngmin";
    Logger().d("뷰 모델 토큰 확인 : ${ref.read(authService).jwtToken}");
    ResponseDto responseDto = await widgetService.fetchGetWidget(userName: userName, jwtToken: ref.read(authService).jwtToken);
    state = WidgetElementModel(responseDto.data);
  }
}
