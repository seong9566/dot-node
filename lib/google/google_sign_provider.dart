import 'package:dot_node/component_widget/custom_snack_bar.dart';
import 'package:dot_node/main.dart';
import 'package:dot_node/web_view/pages/home/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:logger/logger.dart';

/*
 * Project Name:  [DOTnode]
 * Created Date: 2023-07-19 
 * Last Modified: 2023-07-15
 * Author: Hyeonseong
 * Modified By: Hyeonseong
 * copyright @ 2023 TeamDOT
 * --- ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---
 *              Description
 * Google Sign 관련 Provider
 * TODO: Flutter가 토큰 인증을 지원x 보류
 * --- ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---
 */
final googleSignProvider = Provider<GoogleSignProvider>((ref) {
  return GoogleSignProvider(ref);
});

class GoogleSignProvider {
  final Ref ref;
  final dContext = navigatorKey.currentContext;
  GoogleSignProvider(this.ref);

  final googleSignIn = GoogleSignIn();

  // 로그인한 사용자를 저장할 변수
  User? _user;

  // 사용자가 로그인한 경우만 반환하도록 변경
  User get user => _user!;

  Future<void> googleLogin() async {
    try {
      // 구글 로그인
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      //final GoogleSignInAccount? googleUser = await googleSignIn.signInSilently();
      if (googleUser == null) {
        // 사용자가 로그인을 취소한 경우
        return;
      }

      // Firebase Authentication에 사용자 정보 추가
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final googleAuthCredential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final userCredential = await FirebaseAuth.instance
          .signInWithCredential(googleAuthCredential);
      _user = userCredential.user;
      Logger().d("로그 확인 : $_user");
      ScaffoldMessenger.of(dContext!)
          .showSnackBar(CustomSnackBar(msg: "${_user!.displayName}님 환영합니다!"));
      Get.to(() => HomePage());
    } catch (error) {
      Logger().d('Google 로그인 에러: $error');
    }
  }
}
