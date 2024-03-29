import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:http/http.dart';
/*
 * Project Name:  [DOTnode]
 * Created Date: 2023-05-19 
 * Last Modified: 2023-12-03
 * Author: Hyeonseong
 * Modified By: Hyeonseong
 * copyright @ 2023 TeamDOT
 * --- ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---
 *              Description
 * 서버와 통신을 위한 Connect
 * Get, Delete, Post,Put 요청
 * 
 * 주의사항 
 * 3. Bearer는 서버에서 직접 벗김. 내가 굳이 다시 가공할 필요 x
 * --- ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---
 */

final httpConnector = Provider<HttpConnector>((ref) {
  return HttpConnector();
});

class HttpConnector {
  //header의 content 타입
  Map<String, String> headers = {
    "Content-Type": "application/json;charset=utf-8"
  };

  //static const host = "http://localhost:8001";

  // ec2 host
  String host = "https://node.o-r.kr:443";

  //핫스팟 사용시 임시 host
  //static const host = "http://172.20.10.9:8001";

  static final HttpConnector _instance = HttpConnector._single();
  HttpConnector._single();
  factory HttpConnector() {
    Logger().d("HttpConnector 객체 생성");
    return _instance;
  }

  //Token인증
  Future<Response> getInitToken(String path, String? refreshToken) async {
    Logger().d("getInitToken 실행");
    Map<String, String> requestHeader = {
      ...headers,
      "Refresh-Token": refreshToken!
    };
    Uri uri = Uri.parse("$host$path");
    Response response = await Client().get(uri, headers: requestHeader);
    return response;
  }

  //get
  Future<Response> get(String path, {String? jwtToken}) async {
    //1. Header
    Map<String, String> requestHeader = {
      ...headers,
      "Access-Token": jwtToken ?? ""
    };
    //2. Uri parse
    Uri uri = Uri.parse("$host$path");
    //3. response
    Response response = await Client().get(uri, headers: requestHeader);
    return response;
  }

  //post
  Future<Response> post(String path, String body, {String? jwtToken}) async {
    Map<String, String> requestHeader = {
      ...headers,
      "Access-Token": jwtToken ?? ""
    };

    Uri uri = Uri.parse("$host$path");
    Logger().d("uri chekc$uri");
    Response response =
        await Client().post(uri, body: body, headers: requestHeader);
    return response;
  }

  //put
  Future<Response> put(String path, String body, {String? jwtToken}) async {
    Map<String, String> requestHeader = {
      ...headers,
      "Access-Token": jwtToken ?? ""
    };
    Uri uri = Uri.parse("$host$path");
    Response response =
        await Client().put(uri, body: body, headers: requestHeader);
    return response;
  }

  //delete
  Future<Response> delete(String path, String body, {String? jwtToken}) async {
    Map<String, String> requestHeader = {
      ...headers,
      "Access-Token": jwtToken ?? ""
    };
    Uri uri = Uri.parse("$host$path");
    Response response =
        await Client().delete(uri, headers: requestHeader, body: body);
    return response;
  }
}
