import 'package:dot_node/core/util/custom_snack_bar.dart';
import 'package:dot_node/dto/request/auth_req_dto.dart';
import 'package:dot_node/dto/request/email_ver_req_dto.dart';
import 'package:dot_node/dto/request/sms_ver_req_dto.dart';
import 'package:dot_node/dto/response_dto.dart';
import 'package:dot_node/main.dart';
import 'package:dot_node/service/local_service.dart';
import 'package:dot_node/service/user_service.dart';
import 'package:dot_node/web_view/components/custom_alert_dialog.dart';
import 'package:dot_node/web_view/pages/auth/components/verfication_modal.dart';
import 'package:dot_node/web_view/pages/auth/web_login_page.dart';
import 'package:dot_node/web_view/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'dart:async';

import '../models/user.dart';

/*
 * Project Name:  [DOTnode]
 * Created Date: 2023-05-19 
 * Last Modified: 2023-09-01
 * Author: Hyeonseong
 * Modified By: Hyeonseong
 * copyright @ 2023 TeamDOT
 * --- ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---
 *              Description
 * Controller는 Service에 요청 및 비즈니스 로직을 담당.
 * 여기서 정의 하는 비즈니스 로직이란?
 * : 페이지 이동, 알림창, ViewModel에 데이터 넘겨주기
 * 
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

  Future<void> sign({required String userUid, required String userEmail, required String userPassword, required String userTel}) async {
    // 1. Dto
    final signReqDto = SignReqDto(userUid: userUid, userEmail: userEmail, userPassword: userPassword, userTel: userTel, userRole: "USER");
    // 2. Service 요청
    try {
      ResponseDto responseDto = await userService.fetchSign(signReqDto);
      if (responseDto.code == "CREATED") {
        ScaffoldMessenger.of(dContext!).showSnackBar(CustomSnackBar(msg: "회원가입 성공"));
        Get.to(() => WebLoginPage());
      } else {
        showDialog(
          context: dContext!,
          builder: (context) => CustomAlertDialog(msg: '${responseDto.msg}'.tr),
        );
      }
    } catch (e) {
      // 예외 발생 시 로그 출력
      Logger().d("$e, name : userController, method : sign");
    }
  }

//로그인
  Future<void> login({required String userEmail, required String userPassword}) async {
    final loginReqDto = LoginReqDto(userEmail: userEmail, userPassword: userPassword);

    try {
      final responseDto = await userService.fetchLogin(loginReqDto);

      // 로그인 성공 시
      if (responseDto.msg == "login success") {
        //TODO: response에 uid,email가 있을때 주석 풀기.
        //String uid = responseDto.data;
        User user = User(uid: "이현성", userEmail: userEmail);
        LocalService().fetchSessionUser(user: user);
        ScaffoldMessenger.of(dContext!).showSnackBar(CustomSnackBar(msg: "환영합니다!"));
        Get.to(() => HomePage());
      } else {
        // 로그인 실패 시 경고창 표시
        showDialog(
          context: dContext!,
          builder: (context) => CustomAlertDialog(msg: '로그인 실패, 아이디와 패스워드를 확인해 주세요.'.tr),
        );
      }
    } catch (e) {
      // 예외 발생 시 로그 출력
      Logger().d("$e, name : userController, method : login");
    }
  }

  Future<void> userNameCheck({required String username}) async {
    ResponseDto responseDto = await userService.fetchUsernameCheck(username);
    if (responseDto.code == "OK") {
      //result값 추출
      dynamic result = responseDto.data['result'];
      if (result == true) {
        ScaffoldMessenger.of(dContext!).showSnackBar(CustomSnackBar(msg: "사용 가능한 이름 입니다."));
      } else if (result == false) {
        ScaffoldMessenger.of(dContext!).showSnackBar(CustomSnackBar(msg: "이미 사용중인 이름입니다."));
      }
    } else {
      ScaffoldMessenger.of(dContext!).showSnackBar(CustomSnackBar(msg: "잘못된 요청 입니다."));
    }
  }

  Future<void> smsVerification({required String uid, required String to}) async {
    SmsVerReqDto smsVerReqDto = SmsVerReqDto(uid: uid, to: to, content: "sms 테스트");
    try {
      ResponseDto responseDto = await userService.fetchSmsVerification(smsVerReqDto);
      if (responseDto.code == "OK") {
        return showDialog(
            context: dContext!,
            builder: ((context) => VerificationModal(
                  uid: uid,
                  from: to,
                )));
      } else if (uid.isEmpty) {
        ScaffoldMessenger.of(dContext!).showSnackBar(CustomSnackBar(msg: "이름을 확인해주세요."));
      } else {
        ScaffoldMessenger.of(dContext!).showSnackBar(CustomSnackBar(msg: "중복된 전화번호 입니다."));
      }
    } catch (e) {
      Logger().d("$e, name : userController, method : smsVerification");
    }
  }

  Future<void> smsVerCheck({required String uid, required String from, required String key}) async {
    SmsVerCheckReqDto smsVerCheckReqDto = SmsVerCheckReqDto(uid: uid, from: from, key: key);
    ResponseDto responseDto = await userService.fetchSmsVerCheck(smsVerCheckReqDto);

    if (responseDto.code == 'OK') {
      ScaffoldMessenger.of(dContext!).showSnackBar(CustomSnackBar(msg: "인증 성공"));

      Get.back();
    } else {
      Logger().d("인증 에러 :  ${responseDto.msg}");
    }
  }

  Future<void> emailVerification({required String uid, required String to}) async {
    EmailVerReqDto emailVerReqDto = EmailVerReqDto(uid: uid, to: to, title: "email 테스트");
    try {
      ResponseDto responseDto = await userService.fetchEmailVerification(emailVerReqDto);
      if (responseDto.code == 'OK' && responseDto.data != null) {
        ScaffoldMessenger.of(dContext!).showSnackBar(CustomSnackBar(msg: "메일을 확인해 주세요."));
      } else {
        ScaffoldMessenger.of(dContext!).showSnackBar(CustomSnackBar(msg: "메일이 중복되었습니다."));
      }
    } catch (e) {
      Logger().d("$e, name : userController, method : emailVerification");
    }
  }
}
