import 'dart:async';

import 'package:dio/dio.dart';

class ApiError {
  /// [apiErrorMessage] api 호출 오류 발생 했을 때 사용 할 메세지
  /// [parseErrorMessage] 파싱 오류 발생 했을 때 사용 할 메세지
  /// [call] api 호출하는 함수
  /// [parsing] 데이터 파싱하고 결과 값 리턴하는 함수
  static Future<T> run<T>({
    required String apiErrorMessage,
    required String parseErrorMessage,
    required Future<Response?> Function() call,
    required T Function(Response response) parsing,
  }) async {
    Response? response;
    try {
      response = await call();
      if (response == null) throw "";
    } catch (e) {
      /// Dio에서 map으로 데이터를 보내는 경우가 있다.
      /// 이 경우에는 rethrow를 사용해서 팝업 호출 할 것
      if (e is Map) {
        rethrow;
      }
      throw {
        "message": "$apiErrorMessage\n$e",
      };
    }

    try {
      return parsing(response);
    } catch (e) {
      throw {
        "message": "$parseErrorMessage\n$e",
      };
    }
  }
}
