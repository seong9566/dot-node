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
          'userUid': 'ID',
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
          'hint_userUid': 'Please enter your ID',
          'hint_password': 'Please enter your Password',
          'hint_name': 'Please enter your Name',
          'hint_phoneNumber': 'Please enter your PhoneNumber',
          'hint_email': 'Please enter your Email',
          'hint_password_check': 'Please re-enter your password',
          'hint_verificationNumber': 'Please enter your verificationNumber'
        },
        //KR
        'kr_KR': {
          'userUid': '아이디',
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
          'hint_userUid': '아이디를 입력해주세요',
          'hint_password': '비밀번호를 입력해주세요',
          'hint_name': '이름을 입력해주세요',
          'hint_phoneNumber': '휴대폰번호를 입력해주세요',
          'hint_email': '이메일을 입력해주세요',
          'hint_password_check': '비밀번호를 한번 더 입력해 주세요',
          'hint_verificationNumber': '인증번호를 입력해 주세요.'
        },
      };
}
