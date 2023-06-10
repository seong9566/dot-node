import 'dart:convert';

import 'package:dot_node/core/http_connector.dart';
import 'package:dot_node/dto/request/widget_insert_req_dto.dart';
import 'package:dot_node/dto/response_dto.dart';
import 'package:dot_node/dto/response_util.dart';
import 'package:http/http.dart';

class WidgetService {
  final HttpConnector httpConnector = HttpConnector();

  static final WidgetService _instance = WidgetService._single();
  WidgetService._single();
  factory WidgetService() {
    return _instance;
  }

  Future<ResponseDto> fetchInsert(WidgetInsertReqDto widgetInsertReqDto) async {
    String requestBody = jsonEncode(widgetInsertReqDto.toJson());
    Response response = await httpConnector.post("/widget/test", requestBody);
    return toResponseDto(response);
  }
}
