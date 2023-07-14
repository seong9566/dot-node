import 'dart:convert';

import 'package:dot_node/core/http_connector.dart';
import 'package:dot_node/dto/request/auth_req_dto.dart';
import 'package:dot_node/dto/request/email_ver_req_dto.dart';
import 'package:dot_node/dto/request/sms_ver_req_dto.dart';
import 'package:dot_node/dto/response_dto.dart';
import 'package:dot_node/dto/response_util.dart';
import 'package:dot_node/models/user_token.dart';
import 'package:logger/logger.dart';
import 'package:http/http.dart';
/*
 * Project Name:  [DOTnode]
 * Created Date: 2023-05-19
 * Last Modified: 2023-07-01
 * Author: Hyeonseong
 * Modified By: Hyeonseong
 * copyright @ 2023 TeamDOT
 * --- ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---
 *              Description
 * Service는 서버와 API통신, Parsing을 담당.
 * UserService도 싱글톤을 관리
 * HttpConnector 객체를 생성해 요청
 * 
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

  // 로그인시 response에는 token만 담도록 하기
  Future<ResponseDto> fetchLogin(LoginReqDto loginReqDto) async {
    Logger().d("service에서 connect요청");
    //1. json 변환
    String requestBody = jsonEncode(loginReqDto.toJson());
    //2. 통신
    Response response = await httpConnector.post("/auth/login", requestBody);
    String? jwtToken = response.headers['access-token'].toString();
    ResponseDto responseDto = toResponseDto(response);
    Logger().d("user_service 확인 : ${responseDto.data}");
    Logger().d("user_service 확인 : ${responseDto.msg}");
    if (responseDto.code == "OK") {
      UserToken userToken = UserToken(jwtToken, true);
      responseDto.data = userToken;
    }
    return responseDto;
  }

  // 중복체크
  Future<ResponseDto> fetchUsernameCheck(String username) async {
    Response response = await httpConnector.get("/auth/check-id/$username");
    return toResponseDto(response);
  }

//{{api-url}}/auth/sms-naver
  Future<ResponseDto> fetchSmsVerification(SmsVerReqDto smsVerReqDto) async {
    String requestBody = jsonEncode(smsVerReqDto.toJson());
    Response response = await httpConnector.post("/auth/sms-naver", requestBody);
    ResponseDto responseDto = toResponseDto(response);
    return responseDto;
  }

//{{api-url}}/auth/email
  Future<ResponseDto> fetchEmailVerification(EmailVerReqDto emailVerReqDto) async {
    String requestBody = jsonEncode(emailVerReqDto.toJson());
    Response response = await httpConnector.post("/auth/email", requestBody);
    ResponseDto responseDto = toResponseDto(response);
    return responseDto;
  }

//{{api-url}}/auth/check-key
  Future<ResponseDto> fetchSmsVerCheck(SmsVerCheckReqDto smsVerCheckReqDto) async {
    String requestBody = jsonEncode(smsVerCheckReqDto.toJson());
    Response response = await httpConnector.post('/auth/check-key', requestBody);
    ResponseDto responseDto = toResponseDto(response);
    return responseDto;
  }
}
