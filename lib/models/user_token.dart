import 'package:dot_node/service/local_service.dart';
/*
 * Project Name:  [DOTnode]
 * Created Date: 2023-05-23 
 * Last Modified: 2023-05-23
 * Author: Hyeonseong
 * Modified By: Hyeonseong
 * copyright @ 2023 TeamDOT
 * 
 * --- ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---
 *              Description
 * Secure Storage를 활용한 자동 로그인 
 * 
 * --- ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---
 */

class UserToken {
  // 유저의 정보가 필요하다면 추가.
  static String? _jwtToken;
  static bool _isLogin = false;

  static get jwtToken => _jwtToken;

  static void successAuthentication(String jwtToken) {
    _isLogin = true;
    _jwtToken = jwtToken;
  }

  static Future<void> removeAuthentication() async {
    _jwtToken = null;
    _isLogin = false;
    await LocalService().fetchRemoveJwtToke();
  }

  static Map<String, String> getJwtTokenHeader(Map<String, String> headers) {
    return UserToken._jwtToken == null
        ? headers
        : {...headers, "Authorization": UserToken._jwtToken!};
  }
}
