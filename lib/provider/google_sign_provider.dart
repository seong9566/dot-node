import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
 * --- ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---
 */
final googleSignProvider = Provider<GoogleSignProvider>((ref) {
  return GoogleSignProvider(ref);
});

class GoogleSignProvider {
  final Ref _ref;
  GoogleSignProvider(this._ref);

  final googleSignIn = GoogleSignIn();

  // 로그인한 사용자를 저장할 변수
  User? _user;

  // 사용자가 로그인한 경우만 반환하도록 변경
  User get user => _user!;

  Future<void> googleLogin() async {
    try {
      // 구글 로그인
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
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
    } catch (error) {
      Logger().d('Google 로그인 에러: $error');
    }
  }
}
