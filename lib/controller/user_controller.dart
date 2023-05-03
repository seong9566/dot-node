import 'dart:async';

import 'package:dot_node/dto/request/auth_req_dto.dart';
import 'package:dot_node/dto/response_dto.dart';
import 'package:dot_node/service/local_service.dart';
import 'package:dot_node/service/user_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

/*
 * Project Name:  [DOTnode]
 * Created Date: 2023-05-19 
 * Last Modified: 2023-05-19
 * Author: Hyeonseong
 * Modified By: Hyeonseong
 * copyright @ 2023 TeamDOT
 * --- ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---
 *              Description
 * Controller는 Service에 요청 및 비즈니스 로직을 담당.
 * 여기서 정의 하는 비즈니스 로직이란?
 * : 페이지 이동, 알림창, ViewModel에 데이터 넘겨주기
 * 
 * Future로 비동기 처리 하기
 * --- ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---
 */
final userController = Provider<UserController>((ref) {
  return UserController(ref);
});

class UserController {
  final UserService userService = UserService();
  final Ref _ref;
  UserController(this._ref);

  Future<void> sign(
      {required String username,
      required String userEmail,
      required String userPassword}) async {
    // 1. Dto
    SignReqDto signReqDto = SignReqDto(
        username: username, userEmail: userEmail, userPassword: userPassword);
    // 2. Service 요청
    ResponseDto responseDto = await userService.fetchSign(signReqDto);
    Logger().d("responseDto.code : ${responseDto.code}");
    Logger().d("responseDto.data: ${responseDto.data}");
    Logger().d("responseDto.msg : ${responseDto.msg}");
    // 3. 비즈니스 로직
    if (responseDto.code == "OK") {
      return;
    }
    return;
  }

  Future<void> login(
      {required String userEmail, required String userPassword}) async {
    // 1. Dto
    LoginReqDto loginReqDto =
        LoginReqDto(userEmail: userEmail, userPassword: userPassword);
    // 2. Service 요청
    Logger().d("controller 서비스 요청");
    ResponseDto responseDto = await userService.fetchLogin(loginReqDto);
    Logger().d("responseDto.code : ${responseDto.code}");
    Logger().d("responseDto.data: ${responseDto.data}");
    Logger().d("responseDto.msg : ${responseDto.msg}");
    // 3. 비즈니스 로직
    if (responseDto.code == "OK") {
      //Logger().d("컨트롤러 토큰 인증 실행 ");
      // await LocalService().fetchJwtToken();
    }
    return;
  }

  Future<void> usernameCheck({required String username}) async {
    // 2. Service 요청
    ResponseDto responseDto = await userService.fetchUsernameCheck(username);
    Logger().d("responseDto.code : ${responseDto.code}");
    Logger().d("responseDto.data $username: ${responseDto.data}");
    Logger().d("responseDto.msg : ${responseDto.msg}");
    // 3. 비즈니스 로직
    if (responseDto.code == "OK") {
      return;
    }
    return;
  }
}
