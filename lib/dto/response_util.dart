import 'dart:convert';

import 'package:dot_node/dto/response_dto.dart';
import 'package:http/http.dart';

/*
 * Project Name:  [DOTnode]
 * Created Date: 2023-05-19
 * Last Modified: 2023-05-19
 * Author: Hyeonseong
 * Modified By: Hyeonseong
 * copyright @ 2023 TeamDOT
 * --- ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---
 *              Description
 * http의 Response -> ResponseDto로 파싱
 * 전달받은 json -> dart
 * --- ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---
 */
ResponseDto toResponseDto(Response response) {
  //1. 문자열 -> Map
  Map<String, dynamic> responseMap = jsonDecode(response.body);
  // statusCode를 커스텀 할 경우 사용
  // responseMap['statusCode'] = response.statusCode;

  //2, Map -> Dart class
  ResponseDto responseDto = ResponseDto.fromJson(responseMap); // Map -> Dart Class
  return responseDto;
}
