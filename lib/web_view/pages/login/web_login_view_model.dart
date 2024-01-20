import 'package:dot_node/controller/ihp_controller.dart';
import 'package:dot_node/core/route_page.dart';
import 'package:dot_node/main.dart';
import 'package:dot_node/service/local_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final webLoginViewModel = Provider<WebLoginViewModel>((ref) {
  return WebLoginViewModel(ref);
});

class WebLoginViewModel {
  Ref ref;
  WebLoginViewModel(this.ref);
  final context = navigatorKey.currentContext;

  Future<void> login(
      {required String userEmail, required String userPassword}) async {
    /// state = LoginModel
    /// 토큰은 저장은 api에서 파싱과 동시에 바로 진행함.
    DotController()
        .login(userEmail: userEmail, userPassword: userPassword)
        .then((value) {
      /// Token을 state에서 제외
      secureStorage.write(key: "jwtToken", value: value.jwtToken);
      secureStorage.write(key: "refreshToken", value: value.refreshToken);
      value.jwtToken = "";
      value.refreshToken = "";
    });

    RoutePage.move(context!, RoutePage.personal);
  }
}
