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

class UserToken {
  final String? _jwtToken;
  final bool? _isLogin;

  UserToken(this._jwtToken, this._isLogin);

  get jwtToken => _jwtToken!;
  get isLogin => _isLogin!;
}
