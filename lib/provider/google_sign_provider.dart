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

  GoogleSignInAccount? _user;

  GoogleSignInAccount get user => _user!;

  Future<void> googleLogin() async {
    //final googleUser = await googleSignIn.signIn();
    // final googleUser = await googleSignIn.signInSilently();
    // if (googleUser == null) return;
    // _user = googleUser;
    // Logger().d("로그인 정보 : ${googleUser.email}");
    // final googleAuth = await googleUser.authentication;
    // final credential = GoogleAuthProvider.credential(
    //   accessToken: googleAuth.accessToken,
    //   idToken: googleAuth.idToken,
    // );
    // await FirebaseAuth.instance.signInWithCredential(credential);

    try {
      UserCredential userCredential;

      //구글 로그인
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      //Firebase Authentication에 사용자 정보추가
      final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;
      final googleAuthCredential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      userCredential = await FirebaseAuth.instance.signInWithCredential(googleAuthCredential);
      final user = userCredential.user;
    } catch (error) {
      Logger().d(error);
    }
  }
}
