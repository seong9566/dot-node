import 'package:dot_node/core/route_page.dart';
import 'package:dot_node/models/session_user.dart';
import 'package:dot_node/service/local_service.dart';
import 'package:dot_node/util/locale_string.dart';
import 'package:dot_node/web_view/pages/auth/sign_in_view.dart';
import 'package:dot_node/web_view/pages/auth/login_view.dart';
import 'package:dot_node/web_view/pages/home/home_page.dart';
import 'package:dot_node/web_view/pages/personal/personal_view.dart';
import 'package:dot_node/web_view/pages/personal/widget_update_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

/*
 * Project Name:  [DOTnode]
 * Created Date: 2023-04-29 
 * Last Modified: 2024-01-17
 * Author: Hyeonseong
 * Modified By: Hyeonseong
 * copyright @ 2023 TeamDOT
 * --- ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---
 *              Description
 * ensureInitialized() : 앱의 바인딩이 최화 되었는지 확인.
 * - main()메소드나 secureStorge에서 비동기로 데이터를 다루어야 할 경우 필요하다.
 * - Flutter 엔진과 위젯의 바인딩이 미리 완료 되어 있게 만들어준다.
 * TODO:: 각 뷰에서 미디어 쿼리로 진행 하면 부드럽게 가능할지도
 * TODO: HomePage를 메인으로 변경 (HomePage 구상 완료 까지만)
 * --- ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---
 */
final navigatorKey = GlobalKey<NavigatorState>();
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalService().fetchJwtToken();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyAeGR8vnCeVdx3_rcawQJLSxywp9IVeExs",
      appId: "1:796745330897:web:1c0e63f670633eefd915f0",
      messagingSenderId: "796745330897",
      projectId: "dot-node",
    ),
  );
  if (kIsWeb) {
    runApp(const ProviderScope(child: MyWeb()));
  }
}

//웹
class MyWeb extends StatelessWidget {
  const MyWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1024, 1633),
      builder: (context, child) {
        return GetMaterialApp(
          navigatorKey: navigatorKey,
          debugShowCheckedModeBanner: false,
          translations: LocaleString(),
          locale: const Locale('kr_KR'), // kr_KR, en_US
          // home: const WebSignUpPage(),
          // home: SessionUser.isLogin ? PersonalView() : LoginView(),
          home: HomePage(),
          // home: PersonalPage(),
          initialRoute: SessionUser.isLogin ? RoutePage.home : RoutePage.login,
          // initialRoute: RoutePage.sign,
          routes: {
            RoutePage.login: (_) => const LoginView(),
            RoutePage.sign: (_) => const SignInView(),
            RoutePage.home: (_) => const HomePage(),
            RoutePage.personal: (_) => const PersonalView(),
            RoutePage.widgetUpdate: (_) => const WidgetUpdateView(),
          },
        );
      },
    );
  }
}
