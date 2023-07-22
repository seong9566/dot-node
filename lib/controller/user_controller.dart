import 'package:dot_node/dto/request/auth_req_dto.dart';
import 'package:dot_node/dto/request/email_ver_req_dto.dart';
import 'package:dot_node/dto/request/sms_ver_req_dto.dart';
import 'package:dot_node/dto/response_dto.dart';
import 'package:dot_node/main.dart';
import 'package:dot_node/provider/auth_provider.dart';
import 'package:dot_node/service/user_service.dart';
import 'package:dot_node/web_view/components/custom_alert_dialog.dart';
import 'package:dot_node/web_view/pages/auth/components/verfication_modal.dart';
import 'package:dot_node/web_view/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'dart:async';

/*
 * Project Name:  [DOTnode]
 * Created Date: 2023-05-19 
 * Last Modified: 2023-07-13
 * Author: Hyeonseong
 * Modified By: Hyeonseong
 * copyright @ 2023 TeamDOT
 * --- ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---
 *              Description
 * Controller는 Service에 요청 및 비즈니스 로직을 담당.
 * 여기서 정의 하는 비즈니스 로직이란?
 * : 페이지 이동, 알림창, ViewModel에 데이터 넘겨주기
 * 
 * sms,email인증 메시지 발송까진 되어있음, 발송 이후 인증 로직 아직 미구현.
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
    SignReqDto signReqDto = SignReqDto(userUid: userUid, userEmail: userEmail, userPassword: userPassword, userTel: userTel, userRole: "USER");
    // 2. Service 요청
    ResponseDto responseDto = await userService.fetchSign(signReqDto);
    Logger().d("responseDto.code : ${responseDto.code}");
    Logger().d("responseDto.data: ${responseDto.data}");
    Logger().d("responseDto.msg : ${responseDto.msg}");
    // 3. 비즈니스 로직
    if (responseDto.code == "CREATED") {
      ScaffoldMessenger.of(dContext!).showSnackBar(
        SnackBar(
          content: Text('회원가입 성공!', style: TextStyle(color: Colors.black)),
          duration: Duration(seconds: 3), //올라와있는 시간
          backgroundColor: Colors.white,
          behavior: SnackBarBehavior.floating,
        ),
      );
      Get.to(() => HomePage());
      return;
    } else {
      ScaffoldMessenger.of(dContext!).showSnackBar(
        SnackBar(
          content: Text('${responseDto.msg}', style: TextStyle(color: Colors.black)),
          duration: Duration(seconds: 3), //올라와있는 시간
          backgroundColor: Colors.white,
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
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
      _ref.read(authProvider.notifier).authentication(responseDto.data);
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
    // if (responseDto.code == "OK") {
    //   if (responseDto.data is Map<String, dynamic>) {
    //     dynamic result = responseDto.data['result'];
    //     Logger().d("여기가 실행 안됌? $result");
    //     setIsUsernameValid(result);
    //     Logger().d("valid 컨트롤러에서 확인 : $isUsernameValid");
    //   }
    //   return;
    // }
    if (responseDto.code == "OK") {
      //result값 추출
      dynamic result = responseDto.data['result'];
      Logger().d("result = ? $result");
      Logger().d("result = ? ${result.runtimeType}");

      if (result == true) {
        ScaffoldMessenger.of(dContext!).showSnackBar(
          SnackBar(
            content: Text('사용 가능한 이름 입니다.', style: TextStyle(color: Colors.black)),
            duration: Duration(seconds: 3), //올라와있는 시간
            backgroundColor: Colors.white,
            behavior: SnackBarBehavior.floating,
          ),
        );
      } else if (result == false) {
        ScaffoldMessenger.of(dContext!).showSnackBar(
          SnackBar(
            content: Text('이미 사용중인 이름입니다.', style: TextStyle(color: Colors.black)),
            duration: Duration(seconds: 3), //올라와있는 시간
            backgroundColor: Colors.white,
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(dContext!).showSnackBar(
        SnackBar(
          content: Text('잘못된 요청 입니다.', style: TextStyle(color: Colors.black)),
          duration: Duration(seconds: 3), //올라와있는 시간
          backgroundColor: Colors.white,
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  Future<void> smsVerification({required String uid, required String to}) async {
    SmsVerReqDto smsVerReqDto = SmsVerReqDto(uid: uid, to: to, content: "sms 테스트");
    ResponseDto responseDto = await userService.fetchSmsVerification(smsVerReqDto);
    Logger().d("to : $to");
    Logger().d("데이터 확인 : ${responseDto.data}");
    Logger().d("데이터 확인 : ${responseDto.code}");
    Logger().d("데이터 확인 : ${responseDto.msg}");
    if (responseDto.code == "OK") {
      return showDialog(
          context: dContext!,
          builder: ((context) => VerificationModal(
                uid: uid,
                from: to,
              )));
    }
  }

//   {
//     "uid":"heo",
//     "from":"010999664",
//     "key":"k80"
// }
  Future<void> smsVerCheck({required String uid, required String from, required String key}) async {
    SmsVerCheckReqDto smsVerCheckReqDto = SmsVerCheckReqDto(uid: uid, from: from, key: key);
    ResponseDto responseDto = await userService.fetchSmsVerCheck(smsVerCheckReqDto);
    Logger().d("데이터 확인 : ${responseDto.data}");
    Logger().d("데이터 확인 : ${responseDto.code}");
    Logger().d("데이터 확인 : ${responseDto.msg}");
    if (responseDto.code == 'OK') {
      ScaffoldMessenger.of(dContext!).showSnackBar(SnackBar(
        content: Text('인증 성공', style: TextStyle(color: Colors.black)),
        duration: Duration(seconds: 3), //올라와있는 시간
        backgroundColor: Colors.white,
        behavior: SnackBarBehavior.floating,
      ));
      Get.back();
    } else {
      Logger().d("인증 에러 :  ${responseDto.msg}");
    }
  }

  Future<void> emailVerification({required String uid, required String to}) async {
    EmailVerReqDto emailVerReqDto = EmailVerReqDto(uid: uid, to: to, title: "email 테스트");
    ResponseDto responseDto = await userService.fetchEmailVerification(emailVerReqDto);
    Logger().d("to : $to");
    Logger().d("데이터 확인 : ${responseDto.data}");
    Logger().d("데이터 확인 : ${responseDto.code}");
    Logger().d("데이터 확인 : ${responseDto.msg}");
  }
}
