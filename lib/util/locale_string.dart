// ignore: file_names
import 'package:get/get.dart';

/*
 * Project Name:  [DOTnode]
 * Created Date: 2023-05-03 15:10:12
 * Last Modified: 2023-05-03 18:11:20
 * Author: Hyeonseong
 * Modified By: Hyeonseong
 * copyright @ 2023 TeamDOT
 * --- ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---
 *              Description
 *  Localization
 *  현재 영어, 한국어 버전만 있음
 * --- ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---
 */
class LocaleString extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        //US
        'en_US': {
          'id': 'ID',
          'password': 'Password',
          'name': 'Name',
          'phoneNumber': 'PhoneNumber',
          'email': 'Email',
          'password_check': 'Password Check',
          'verificationNumber': 'verificationNumber',
          // button
          'login': 'Login',
          'sign': 'Sign up',
          'getStarted': 'Get Started',
          'verify': 'Verify',
          // hime Text
          'hint_id': 'ID',
          'hint_password': 'Password',
          'hint_name': 'Please enter your Name',
          'hint_phoneNumber': 'Phone',
          'hint_email': 'E-mail',
          'hint_password_check': 'Password',
          'hint_verificationNumber': 'Please enter your verificationNumber'
        },
        //KR
        'kr_KR': {
          'id': '아이디',
          'password': '비밀번호',
          'name': '이름',
          'phoneNumber': '휴대폰 번호',
          'email': '이메일',
          'password_check': '비밀번호 확인',
          'verificationNumber': '인증번호 입력',
          // button
          'login': '로그인',
          'sign': '회원가입',
          'getStarted': '시작',
          'verify': '인증',
          // hime Text
          'hint_id': 'ID',
          'hint_password': 'Password',
          'hint_name': '이름을 입력해주세요',
          'hint_phoneNumber': 'Phone',
          'hint_email': 'E-mail',
          'hint_password_check': 'Password',
          'hint_verificationNumber': '인증번호를 입력해 주세요.'
        },
      };
}
