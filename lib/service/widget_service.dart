import 'dart:convert';
import 'package:dot_node/core/http_connector.dart';
import 'package:dot_node/dto/request/widget_insert_req_dto.dart';
import 'package:dot_node/dto/response/widget_get_resp_dto.dart';
import 'package:dot_node/dto/response_dto.dart';
import 'package:dot_node/dto/response_util.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';
/*
 * Project Name:  [DOTnode]
 * Created Date: 2023-6-10 
 * Last Modified: 2023-06-17
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

//TODO : Insert이후 read가 필요함.
  Future<ResponseDto> fetchInsertWidget({required WidgetInsertReqDto widgetInsertReqDto, String? jwtToken}) async {
    Logger().d("Service 실행");
    String requestBody = jsonEncode(widgetInsertReqDto.toJson());
    Logger().d("Service 확인 : $requestBody");
    Response response = await httpConnector.post("/widget", requestBody, jwtToken: jwtToken);
    return toResponseDto(response);
  }

  Future<ResponseDto> fetchGetWidget({required userName, String? jwtToken}) async {
    Response response = await httpConnector.get("/widget/$userName?page=0", jwtToken: jwtToken);
    ResponseDto responseDto = toResponseDto(response);

    List<dynamic> mapList = responseDto.data; //responseDto.data를 dynamic타입으로 바꾸는 것
    List<WidgetGetRespDto> widgetList = mapList.map((e) => WidgetGetRespDto.fromJson(e)).toList();
    responseDto.data = widgetList;
    return responseDto;
  }
}
