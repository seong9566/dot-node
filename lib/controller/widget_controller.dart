import 'package:dot_node/dto/request/widget_insert_req_dto.dart';
import 'package:dot_node/dto/response_dto.dart';
import 'package:dot_node/models/widget_element.dart';
import 'package:dot_node/service/widget_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

/*
 * Project Name:  [DOTnode]
 * Created Date: 2023-06-10 
 * Last Modified: 2023-06-17
 * Author: Hyeonseong
 * Modified By: Hyeonseong
 * copyright @ 2023 TeamDOT
 * --- ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---
 *              Description
 * Widget Controller 
 * 정의 : Widget에서 입력 받은 데이터를 서버에 통신 요청 역할
 * controller는 무조건 void return.
 * --- ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---
 */

final widgetController = Provider<WidgetController>((ref) {
  return WidgetController(ref);
});

class WidgetController {
  final WidgetService widgetService = WidgetService();
  final Ref _ref;
  WidgetController(this._ref);

  Future<void> insertWidget(
      {required String widgetName,
      required String userUid,
      required List<WidgetElement> widgetElement}) async {
    WidgetInsertReqDto widgetInsertReqDto = WidgetInsertReqDto(
        widgetName: widgetName, userUid: userUid, widgetElement: widgetElement);
    ResponseDto responseDto =
        await widgetService.fetchInsertWidget(widgetInsertReqDto);
    Logger().d("responseDto.code : ${responseDto.code}");
    Logger().d("responseDto.data: ${responseDto.data}");
    Logger().d("responseDto.msg : ${responseDto.msg}");
  }

  Future<void> getWidget({required String userName}) async {
    // TODO: 나중에는 user의 권한(Token,ID?) 받아서 해야함.
    ResponseDto responseDto =
        await widgetService.fetchGetWidget(userName: userName);
    Logger().d("responseDto.code : ${responseDto.code}");
    Logger().d("responseDto.data: ${responseDto.data}");
    Logger().d("responseDto.msg : ${responseDto.msg}");
    if (responseDto.code == "OK") {}
  }
}
