import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

abstract class DioBaseApi {
  late final Dio _dio;

  DioBaseApi(this._dio);

  /// 헤더 토큰 업데이트
  void updateHeaderToken(String userToken) {
    _dio.options.headers["authorization"] = userToken;
  }

  ///dio get
  Future<Response?> dioGet(String url,
      {String? urlQuery, Map<String, dynamic>? query}) async {
    try {
      Logger().d("dioGet url : $url, query : $query");
      Response response;
      if (query == null) {
        String parsedUrl = "$url$urlQuery";
        response = await _dio.get(parsedUrl);
      } else if (urlQuery == null) {
        response = await _dio.get(url);
      } else {
        response = await _dio.get(url, queryParameters: query);
      }

      return response;
    } on DioException catch (e) {
      throw {
        "method": "GET",
        "statusCode": e.response?.statusCode,
        "message": e.response?.data["message"] ?? "",
        "url": url,
        "error": e.error,
      };
    }
  }

  ///dio post
  Future<Response?> dioPost(String url, {required dynamic data}) async {
    try {
      Logger().d("dioPost url : $url, data : $data");
      Response response = await _dio.post(url, data: data);
      return response;
    } on DioException catch (e) {
      throw {
        "method": "POST",
        "statusCode": e.response?.statusCode,
        "message": e.response?.data["message"] ?? "",
        "url": url,
        "error": e.error,
      };
    }
  }

  ///dio delete
  Future<Response?> dioPatch(String url, {required dynamic data}) async {
    try {
      Logger().d("dioPatch url : $url, data : $data");

      Response response = await _dio.patch(url, data: data);

      return response;
    } on DioException catch (e) {
      throw {
        "method": "PATCH",
        "statusCode": e.response?.statusCode,
        "message": e.response?.data["message"] ?? "",
        "url": url,
        "error": e.error,
      };
    }
  }

  ///dio delete
  Future<Response?> dioDelete(String url, {required dynamic data}) async {
    try {
      Logger().d("dioDelete url : $url, data : $data");
      Response response = await _dio.delete(url, data: data);

      return response;
    } on DioException catch (e) {
      throw {
        "method": "DELETE",
        "statusCode": e.response?.statusCode,
        "message": e.response?.data["message"] ?? "",
        "url": url,
        "error": e.error,
      };
    }
  }
}
