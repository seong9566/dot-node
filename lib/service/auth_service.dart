import 'package:dot_node/core/http_connector.dart';
import 'package:dot_node/dto/response_dto.dart';
import 'package:dot_node/dto/response_util.dart';
import 'package:dot_node/main.dart';
import 'package:dot_node/models/user_token.dart';
import 'package:dot_node/web_view/pages/home/home_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';
import 'package:get/get.dart' hide Response;

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
final authService = StateNotifierProvider<AuthService, UserToken>((ref) {
  return AuthService(UserToken(null, false), ref);
});

class AuthService extends StateNotifier<UserToken> {
  final mContext = navigatorKey.currentContext;
  final Ref _ref;
  AuthService(super.state, this._ref);

// 자동로그인
  Future<void> autoLogin() async {
    String? jwtToken = await secureStorage.read(key: "jwtToken");
    Logger().d(" Storage Token 확인 $jwtToken");
    if (jwtToken != null && jwtToken.isNotEmpty) {
      Logger().d("여기 호출 되어서 그런가?");
      Response response = await HttpConnector().get("/jwtToken", jwtToken: jwtToken);
      ResponseDto responseDto = toResponseDto(response);
      if (responseDto.code == "OK") {
        //User user = User.fromJson(responseDto.data);
        state = UserToken(jwtToken, true);
        Get.to(HomePage());
      }
    }
  }

  Future<void> authentication(UserToken userToken) async {
    state = userToken;
    await secureStorage.write(key: "jwtToken", value: userToken.jwtToken);
  }

  Future<void> inValidate() async {
    state = UserToken(null, false);
    await secureStorage.delete(key: "jwtToken");
  }
}
