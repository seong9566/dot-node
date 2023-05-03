// ignore: file_names
import 'package:get/get.dart';

class LocaleString extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'id': 'ID',
          'password': 'Password',
          'hint_id': 'Please enter your ID',
          'hint_password': 'Please enter your password',
          'login': 'Login',
          'sign': 'Sign up',
        },
        'kr_KR': {
          'id': '아이디',
          'password': '비밀번호',
          'hint_id': '아이디를 입력해주세요',
          'hint_password': '비밀번호를 입력해주세요',
          'login': '로그인',
          'sign': '회원가입',
        },
      };
}
