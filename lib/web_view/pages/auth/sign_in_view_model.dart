import 'package:dot_node/component_widget/custom_snack_bar.dart';
import 'package:dot_node/constant.dart';
import 'package:dot_node/controller/dot_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../main.dart';

final signInViewModel = Provider<SignInViewModel>((ref) {
  return SignInViewModel(ref);
});

class SignInViewModel {
  Ref ref;
  SignInViewModel(this.ref);
  final context = navigatorKey.currentContext;

  /// 아이디 중복 체크
  Future<void> idCheck({required String userUid}) async {
    DotController().idCheck(userUid: userUid).then((value) {
      if (value == true) {
        ScaffoldMessenger.of(dContext!)
            .showSnackBar(CustomSnackBar(msg: "사용 가능한 이름 입니다."));
      } else {
        ScaffoldMessenger.of(dContext!)
            .showSnackBar(CustomSnackBar(msg: "중복된 이름 입니다."));
      }
    });
  }

  /// 이메일 체크
  Future<void> emailCheck(
      {required String userUid, required String userEmail}) async {
    DotController().emailCheck(userUid: userUid, userEmail: userEmail);
  }

  /// 휴대폰 인증
  Future<void> telCheck(
      {required String userUid, required String userTel}) async {
    DotController().telCheck(userUid: userUid, userTel: userTel);
  }
}
