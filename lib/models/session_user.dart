/*
 * Project Name:  [DOTnode]
 * Created Date: 2023-07-01
 * Last Modified: 2023-07-01
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

import 'package:dot_node/models/user.dart';
import 'package:logger/logger.dart';

import '../service/local_service.dart';

class SessionUser {
  static User? _user;
  static String? _jwtToken;
  static bool? _isLogin = false;
  static String? _refreshToken;

  static get user => _user;
  static get jwtToken => _jwtToken;
  static get isLogin => _isLogin;
  static get refreshToken => _refreshToken;

  static void successAuthentication(User userParam, String jwtToken, String refreshToken) {
    _user = userParam;
    _isLogin = true;
    _jwtToken = jwtToken;
    _refreshToken = refreshToken;
  }

  static Future<void> removeAuthentication() async {
    _user = null;
    _jwtToken = null;
    _isLogin = false;
    _refreshToken = null;
    await LocalService().fetchDeleteJwtToken();
    Logger().d("토큰 삭제 ");
  }
}
