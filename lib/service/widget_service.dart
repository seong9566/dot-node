import 'dart:convert';

import 'package:dot_node/core/http_connector.dart';
import 'package:dot_node/dto/request/widget_insert_req_dto.dart';
import 'package:dot_node/dto/response_dto.dart';
import 'package:dot_node/dto/response_util.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';
/*
 * Project Name:  [DOTnode]
 * Created Date: 2023-6-10 
 * Last Modified: 2023-06-1
 * Author: Hyeonseong
 * Modified By: Hyeonseong
 * copyright @ 2023 TeamDOT
 * --- ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---
 *              Description
 * 
 * WidgetElement를 서버와 통신을 위한 Service
 * 
 * --- ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---
 */

class WidgetService {
  final HttpConnector httpConnector = HttpConnector();

  static final WidgetService _instance = WidgetService._single();
  WidgetService._single();
  factory WidgetService() {
    return _instance;
  }

  Future<ResponseDto> fetchInsertWidget(
      WidgetInsertReqDto widgetInsertReqDto) async {
    String requestBody = jsonEncode(widgetInsertReqDto.toJson());
    Logger().d("Service 확인 : ${requestBody}");
    Response response = await httpConnector.post("/widget", requestBody);
    return toResponseDto(response);
  }

  Future<ResponseDto> fetchGetWidget({required userName}) async {
    // {{api-url}}/widget/youngmin
    Response response = await httpConnector.get("/widget/${userName}");
    return toResponseDto(response);
  }
}
