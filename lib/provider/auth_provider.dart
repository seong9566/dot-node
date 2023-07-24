import 'package:dot_node/main.dart';
import 'package:dot_node/models/user_token.dart';
import 'package:dot_node/web_view/pages/personal/personal_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart' hide Response;
import 'package:logger/logger.dart';

/*
 * Project Name:  [DOTnode]
 * Created Date: 2023-07-01
 * Last Modified: 2023-07-01
 * Author: Hyeonseong
 * Modified By: Hyeonseong
 * copyright @ 2023 TeamDOT
 * --- ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---
 *              Description
 * Auth 관련 Provider
 * Service -> Provider로 수정 
 * 
 * 아직 자동로그인 API가 없음.
 * 
 * --- ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---
 */

const secureStorage = FlutterSecureStorage();
final authProvider = StateNotifierProvider<AuthProvider, UserToken>((ref) {
  return AuthProvider(UserToken(null, false), ref);
});

class AuthProvider extends StateNotifier<UserToken> {
  final mContext = navigatorKey.currentContext;
  final Ref ref;
  AuthProvider(super.state, this.ref);

// 자동로그인
  Future<void> autoLogin() async {
    String? jwtToken = await secureStorage.read(key: "jwtToken");
    state = UserToken(jwtToken, true); // 임의로 넣어둠 나중에 삭제 해야됌.
    Logger().d(" Storage Token 확인 $jwtToken");
    Logger().d("state값 확인 ${state.jwtToken}");
    if (jwtToken != null && jwtToken.isNotEmpty) {
      Get.to(PersonalPage());
    }
  }

  Future<void> authentication(UserToken userToken) async {
    try {
      state = userToken;
      await secureStorage.write(key: "jwtToken", value: userToken.jwtToken);
    } catch (e) {
      Logger().d("$e, name : auth_provider");
    }
  }

  Future<void> inValidate() async {
    state = UserToken(null, false);
    await secureStorage.delete(key: "jwtToken");
  }
}
