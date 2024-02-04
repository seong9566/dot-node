import 'package:dot_node/core/network/dio_api.dart';
import 'package:dot_node/core/util/api_error.dart';
import 'package:dot_node/core/util/urls.dart';
import 'package:dot_node/model/login_model.dart';

class DotApi extends DioBaseApi {
  DotApi(super.dio);

  /// 로그인
  Future<LoginModel> login(
      {required String userEmail, required String userPassword}) async {
    return await ApiError.run<LoginModel>(
      apiErrorMessage: "로그인 api 호출 오류",
      parseErrorMessage: "로그인 수정 파싱 오류",
      call: () async {
        return await dioPost(
          Urls.login,
          data: {"userEmail": userEmail, "userPassword": userPassword},
        );
      },
      parsing: (response) {
        String? jwtToken = response.headers['access-token'].toString();
        String? refreshToken = response.headers['refresh-token'].toString();

        final loginModel = LoginModel.fromJson(response.data);
        LoginData data = LoginData(
            uid: loginModel.data.uid,
            id: loginModel.data.id,
            email: loginModel.data.email);

        return LoginModel(
            jwtToken: jwtToken,
            refreshToken: refreshToken,
            code: loginModel.code,
            msg: loginModel.msg,
            data: data);
      },
    );
  }

  Future<bool> idCheck({required String uid}) async {
    return await ApiError.run<bool>(
      apiErrorMessage: "idCheck api 호출 오류",
      parseErrorMessage: "idCheck 파싱 오류",
      call: () async {
        return await dioGet(Urls.idCheck, urlQuery: uid);
      },
      parsing: (response) {
        print("response : ${response.data}");
        return response.data['data']['result'] as bool;
      },
    );
  }

  /// TODO :: 이메일 체크 에러 나는중 유진이 한테 말하기
  Future<void> emailCheck({required String uid, required String to}) async {
    return await ApiError.run<dynamic>(
      apiErrorMessage: "emailCheck api 호출 오류",
      parseErrorMessage: "emailCheck 파싱 오류",
      call: () async {
        return await dioPost(Urls.email,
            data: {"t": uid, "to": to, "title": "테스트 발송"});
      },
      parsing: (response) {
        print("response data : ${response.data}");
        print("response headers: ${response.headers}");
      },
    );
  }

  ///
  Future<void> telCheck({required String uid, required String to}) async {
    return await ApiError.run<dynamic>(
      apiErrorMessage: "telCheck api 호출 오류",
      parseErrorMessage: "telCheck 파싱 오류",
      call: () async {
        return await dioPost(Urls.smsNaver,
            data: {"uid": uid, "to": to, "content": "테스트 발송"});
      },
      parsing: (response) {
        print("response data : ${response.data}");
        print("response headers: ${response.headers}");
      },
    );
  }
}
