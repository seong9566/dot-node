import 'package:dot_node/core/network/dio_api.dart';

class DotAPI extends DioBaseAPI {
  DotAPI(super.dio);

  /// 로그인
  // Future<LoginModel> login({required String id, required String pw}) async {
  //   return await ApiError.run<LoginModel>(
  //     apiErrorMessage: "로그인 api 호출 오류",
  //     parseErrorMessage: "로그인 수정 파싱 오류",
  //     call: () async {
  //       return await dioPost(
  //         Urls.login,
  //         data: {"userid": id, "password": pw},
  //       );
  //     },
  //     parsing: (response) {
  //       return LoginModel.fromJson(response.data["data"]);
  //     },
  //   );
  // }
}
