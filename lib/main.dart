import 'package:dot_node/auth/login_page.dart';
import 'package:dot_node/locale_string.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/*
 * Project Name:  [DOTnode]
 * Created Date: 2023-04-29 13:17:28
 * Last Modified: 2023-05-03 17:06:12
 * Author: Hyeonseong
 * Modified By: Hyeonseong
 * copyright @ 2023 TeamDOT
 * --- ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---
 *              Description
 * Localization 추가 했음
 * 현재는 main에서 정적으로 사용중임, 어떤 방식으로 Localization을 할것인가? 
 * --- ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---
 */
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: LocaleString(),
      locale: const Locale('kr_KR'),
      home: const LoginPage(),
    );
  }
}
