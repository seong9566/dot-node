import 'dart:convert';

import 'package:dot_node/core/http_connector.dart';
import 'package:dot_node/dto/request/auth_req_dto.dart';
import 'package:dot_node/dto/response_dto.dart';
import 'package:dot_node/dto/response_util.dart';
import 'package:dot_node/service/local_service.dart';
import 'package:logger/logger.dart';
import 'package:http/http.dart';
/*
 * Project Name:  [DOTnode]
 * Created Date: 2023-05-19
 * Last Modified: 2023-05-23
 * Author: Hyeonseong
 * Modified By: Hyeonseong
 * copyright @ 2023 TeamDOT
 * --- ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---
 *              Description
 * Service는 서버와 API통신, Parsing을 담당.
 * UserService도 싱글톤을 관리
 * HttpConnector 객체를 생성해 요청
 * 
 * TODO : 웹으로 하면 Header의 Token이 읽어지지 않음, 웹 쪽 헤더 더 알아보기
 * - 앱으로는 로그인 성공
 * --- ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---
 */

class UserService {
  final HttpConnector httpConnector = HttpConnector();

  //싱글톤
  static final UserService _instance = UserService._single();
  UserService._single();
  factory UserService() {
    Logger().d("UserService 객체 생성");
    return _instance;
  }

  // 회원가입
  Future<ResponseDto> fetchSign(SignReqDto signReqDto) async {
    //1. json 변환
    String requestBody = jsonEncode(signReqDto.toJson());
    //2. 통신
    Response response = await httpConnector.post("/auth/join", requestBody);
    return toResponseDto(response);
  }

  // 로그인
  Future<ResponseDto> fetchLogin(LoginReqDto loginReqDto) async {
    Logger().d("service에서 connect요청");
    //1. json 변환
    String requestBody = jsonEncode(loginReqDto.toJson());
    //2. 통신
    Response response = await httpConnector.post("/auth/login", requestBody);

    //jwtToken write
    //String jwtToken = response.headers["accessToken"].toString();
    // Logger().d("jwtToken : ${jwtToken}");
    //await secureStorage.write(key: "jwtToken", value: jwtToken);

// 헤더 필드 확인  TODO: 예외처리 넣어야함.
    String? jwtToken = response.headers['access-token'].toString();
    await secureStorage.write(key: "jwtToken", value: jwtToken);
    Logger().d('JWT 토큰 값 확인 : $jwtToken');

    return toResponseDto(response);
  }

  // 중복체크
  Future<ResponseDto> fetchUsernameCheck(String username) async {
    Logger().d("username : $username");
    Response response = await httpConnector.get("/auth/check-id/$username");
    return toResponseDto(response);
  }
}
