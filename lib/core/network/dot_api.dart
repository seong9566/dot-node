import 'package:dot_node/core/network/dio_api.dart';
import 'package:dot_node/core/util/api_error.dart';
import 'package:dot_node/core/util/urls.dart';
import 'package:dot_node/model/login_model.dart';
import 'package:dot_node/service/local_service.dart';

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
}
