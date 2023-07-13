import 'dart:async';

import 'package:dot_node/dto/request/auth_req_dto.dart';
import 'package:dot_node/dto/response_dto.dart';
import 'package:dot_node/main.dart';
import 'package:dot_node/service/auth_provider.dart';
import 'package:dot_node/service/user_service.dart';
import 'package:dot_node/web_view/components/custom_alert_dialog.dart';
import 'package:dot_node/web_view/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

/*
 * Project Name:  [DOTnode]
 * Created Date: 2023-05-19 
 * Last Modified: 2023-07-01
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
  final dContext = navigatorKey.currentContext;
  final UserService userService = UserService();
  final Ref _ref;
  UserController(this._ref);

  bool _isUsernameValid = false;

  bool get isUsernameValid => _isUsernameValid;

  void setIsUsernameValid(bool value) {
    _isUsernameValid = value;
  }

  Future<void> sign({required String username, required String userEmail, required String userPassword}) async {
    // 1. Dto
    SignReqDto signReqDto = SignReqDto(username: username, userEmail: userEmail, userPassword: userPassword);
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

// 로그인 성공 후 Token으로 데이터 가져오는 API아직 없음.
  Future<void> login({required String userEmail, required String userPassword}) async {
    // 1. Dto
    LoginReqDto loginReqDto = LoginReqDto(userEmail: userEmail, userPassword: userPassword);
    // 2. Service 요청
    Logger().d("Controller호출");
    ResponseDto responseDto = await userService.fetchLogin(loginReqDto);
    Logger().d("responseDto 확인 : ${responseDto.data.runtimeType}");

    // 3. 비즈니스 로직
    if (responseDto.code == "OK") {
      _ref.read(authService.notifier).authentication(responseDto.data);
      Get.to(() => HomePage());
    } else {
      return showDialog(context: dContext!, builder: ((context) => CustomAlertDialog(msg: 'login_faild'.tr)));
    }
  }

  Future<void> userNameCheck({required String username}) async {
    // 2. Service 요청
    ResponseDto responseDto = await userService.fetchUsernameCheck(username);
    Logger().d("데이터 확인 : ${responseDto.data}");
    Logger().d("데이터 확인 : ${responseDto.code}");
    Logger().d("데이터 확인 : ${responseDto.msg}");
    // 3. 비즈니스 로직
    if (responseDto.code == "OK") {
      if (responseDto.data is Map<String, dynamic>) {
        dynamic result = responseDto.data['result'];
        Logger().d("여기가 실행 안됌? $result");
        setIsUsernameValid(result);
        Logger().d("valid 컨트롤러에서 확인 : $isUsernameValid");
      }
      return;
    }
    return;
  }
}
