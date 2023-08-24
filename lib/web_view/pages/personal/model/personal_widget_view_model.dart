import 'package:dot_node/dto/response_dto.dart';
import 'package:dot_node/provider/auth_provider.dart';
import 'package:dot_node/service/widget_service.dart';
import 'package:dot_node/web_view/pages/home/model/widget_element_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

/*
 * Project Name:  [DOTnode]
 * Created Date: 2023-6-17 
 * Last Modified: 2023-08-21
 * Author: Hyeonseong
 * Modified By: Hyeonseong
 * copyright @ 2023 TeamDOT
 * --- ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---
 *              Description
 * User가 사용중인 Widget의 리스트 ViewModel
 * --- ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---
 */

final personalWidgetViewModel = StateNotifierProvider<PersonalWidgetViewModel, WidgetElementModel?>((ref) {
  return PersonalWidgetViewModel(null, ref)..notifyViewModel();
});

class PersonalWidgetViewModel extends StateNotifier<WidgetElementModel?> {
  final WidgetService widgetService = WidgetService();
  PersonalWidgetViewModel(super.state, this.ref);
  final Ref ref;

  Future<void> notifyViewModel() async {
    try {
      String userUid = "이현성"; // 임시 userUid
      ResponseDto responseDto = await widgetService.fetchGetWidget(userName: userUid, jwtToken: ref.read(authProvider).jwtToken);
      state = WidgetElementModel(responseDto.data);
    } catch (e) {
      Logger().d("Error : $e , name : userWidgetViewModel, method : notifyViewModel");
    }
  }
}
