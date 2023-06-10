import 'package:dot_node/home_page.dart';
import 'package:dot_node/service/local_service.dart';
import 'package:dot_node/view/pages/auth/login_page.dart';
import 'package:dot_node/core/util/locale_string.dart';
import 'package:dot_node/web_view/pages/auth/web_login_page.dart';
import 'package:dot_node/web_view/pages/auth/web_sign_up_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:get/get.dart';

/*
 * Project Name:  [DOTnode]
 * Created Date: 2023-04-29 
 * Last Modified: 2023-06-10
 * Author: Hyeonseong
 * Modified By: Hyeonseong
 * copyright @ 2023 TeamDOT
 * --- ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---
 *              Description
 * ensureInitialized() : 앱의 바인딩이 최화 되었는지 확인.
 * - main()메소드나 secureStorge에서 비동기로 데이터를 다루어야 할 경우 필요하다.
 * - Flutter 엔진과 위젯의 바인딩이 미리 완료 되어 있게 만들어준다.
 * 
 * TODO: HomePage를 메인으로 변경 (HomePage 구상 완료 까지만)
 * --- ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---
 */
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await LocalService().fetchJwtToken();
  if (kIsWeb) {
    runApp(const ProviderScope(child: MyWeb()));
  } else {
    runApp(const ProviderScope(child: MyApp()));
  }
}

//앱
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: LocaleString(),
      locale: const Locale('kr_KR'), // kr_KR, en_US
      home: const LoginPage(),
    );
  }
}

//웹
class MyWeb extends StatelessWidget {
  const MyWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: LocaleString(),
      locale: const Locale('kr_KR'), // kr_KR, en_US
      //home: const WebSignUpPage(),
      //home: const WebLoginPage(),
      home: const HomePage(),
    );
  }
}
