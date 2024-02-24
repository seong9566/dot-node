import 'package:validators/validators.dart';

/*
 * Project Name:  [DOTnode]
 * Created Date: 2023-05-04 23:32:16
 * Last Modified: 2023-05-04 23:32:67
 * Author: Hyeonseong
 * Modified By: Hyeonseong
 * copyright @ 2023 TeamDOT
 * --- ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---
 *              Description
 * 유효성 검증 함수 정의 파일 
 * --- ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---
 */

String? validateUsername(String? value) {
  if (value!.isEmpty) {
    return "이름에 공백이 들어갈 수 없습니다";
  } else if (value.length > 21) {
    return "이름의 길이는 1~20자 이내로 작성해주세요";
  } else if (value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
    return '이름에는 특수 문자가 포함될 수 없습니다';
  } else {
    return null;
  }
}

String? validatePassword(String? value) {
  // 비밀번호는 최소 8자 이상이어야 합니다.
  // 최소 하나의 대문자, 소문자, 숫자, 특수 문자를 포함해야 합니다.
  if (value!.isEmpty) {
    return "패스워드 공백이 들어갈 수 없습니다.";
  } else if (value.length < 9 || value.length > 20) {
    return "패스워드의 길이는 8~20자 이내로 작성해주세요";
  } else if (!value.contains(RegExp(r'[a-zA-Z]'))) {
    return "패스워드에는 영어, 숫자, 특수 문자를 포함해야 합니다.";
  } else if (!value.contains(RegExp(r'[0-9]'))) {
    return "패스워드에는 영어, 숫자, 특수 문자를 포함해야 합니다.";
  } else if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
    return "패스워드에는 영어, 숫자, 특수 문자를 포함해야 합니다.";
  } else {
    return null;
  }
}

String? validateEmail(String? value) {
  if (value!.isEmpty) {
    return "이메일은 공백이 들어갈 수 없습니다.";
  } else if (!isEmail(value)) {
    return "이메일 형식에 맞지 않습니다.";
  } else {
    return null;
  }
}
