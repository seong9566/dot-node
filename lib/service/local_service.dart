import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:logger/logger.dart';
import 'package:http/http.dart';
import '../core/http_connector.dart';
import '../dto/response_dto.dart';
import '../dto/response_util.dart';
import '../models/session_user.dart';
import '../models/user.dart';

const secureStorage = FlutterSecureStorage();

/*
 * Project Name:  [DOTnode]
 * Created Date: 2023-09-01
 * Last Modified: 2023-09-01
 * Author: Hyeonseong
 * Modified By: Hyeonseong
 * copyright @ 2023 TeamDOT
 * --- ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---
 *              Description
 * 자동 로그인 관련 LocalService
 * 
 * --- ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---
 */

class LocalService {
  final HttpConnector httpConnector = HttpConnector();

  static final LocalService _instance = LocalService._single();
  LocalService._single();
  factory LocalService() {
    return _instance;
  }

// 자동로그인
// 성공 시 헤더에 Access-Token을 발급해준다.
  Future<void> fetchJwtToken() async {
    String? refreshToken = await secureStorage.read(key: "refreshToken");
    Logger().d(" Storage Token 확인 $refreshToken");
    if (refreshToken != null && refreshToken.isNotEmpty) {
      try {
        Response response = await HttpConnector().getInitToken("/auth/refresh-token", refreshToken);
        //Access Token저장
        String? jwtToken = response.headers['access-token'].toString();
        ResponseDto responseDto = toResponseDto(response);
        if (responseDto.msg == "login success") {
          String uid = responseDto.data;
          User user = User(uid: uid, userEmail: "dlgustjd9566@gmail.com"); // TODO: userEmail도 추가 하기
          SessionUser.successAuthentication(user, jwtToken, refreshToken);
        }
      } catch (e) {
        Logger().d("$e, name : localService, method : fetchJwtToken");
      }
    } else {
      SessionUser.removeAuthentication();
      Logger().d("토큰 삭제");
    }
  }

  Future<void> fetchSessionUser({required User user}) async {
    Logger().d("fetchSessionUser 실행");
    try {
      String? refreshToken = await secureStorage.read(key: "refreshToken");
      String? jwtToken = await secureStorage.read(key: "jwtToken");
      SessionUser.successAuthentication(user, jwtToken!, refreshToken!);
    } catch (e) {
      Logger().d("$e, name : localService, method : fetchSessionUser");
    }
  }

//토큰 삭제
  Future<void> fetchDeleteJwtToken() async {
    await secureStorage.delete(key: "jwtToken");
    await secureStorage.delete(key: "refreshToken");
  }
}
