import 'package:dot_node/core/http_connector.dart';
import 'package:dot_node/dto/response_dto.dart';
import 'package:dot_node/dto/response_util.dart';
import 'package:dot_node/models/user_token.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';
/*
 * Project Name:  [DOTnode]
 * Created Date: 2023-05-23
 * Last Modified: 2023-05-23
 * Author: Hyeonseong
 * Modified By: Hyeonseong
 * copyright @ 2023 TeamDOT
 * --- ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---
 *              Description
 * 전역적으로 관리가 필요한 Service
 * 
 * 1. JwtToken이 있다면 서버에 인증을 요청
 * 
 * --- ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---
 */

const secureStorage = FlutterSecureStorage();

class LocalService {
  final HttpConnector httpConnector = HttpConnector();

  static final LocalService _instance = LocalService._single();
  LocalService._single();
  factory LocalService() {
    return _instance;
  }

  Future<void> fetchJwtToken() async {
    String? jwtToken = await secureStorage.read(key: "jwtToken");
    Logger().d("read 토큰 확인 : ${jwtToken}");
    //토큰이 존재 및 서버에 유저 인증
    if (jwtToken != null) {
      Response response =
          await httpConnector.getInitToken("/jwtToken", jwtToken);
      ResponseDto responseDto = toResponseDto(response);

      if (responseDto.data != null) {
        Logger().d("responseDto.data 확인 : ${responseDto.data}");
        UserToken.successAuthentication(jwtToken);
      } else {
        UserToken.removeAuthentication();
        Logger().d("UserToken remove 실행");
      }
    } else {
      Logger().d("저장된 토큰이 없습니다.");
    }
  }

  Future<void> fetchRemoveJwtToke() async {
    await secureStorage.delete(key: "jwtToken");
  }
}
