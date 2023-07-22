/*
 * Project Name:  [DOTnode]
 * Created Date: 2023-05-19
 * Last Modified: 2023-07-13
 * Author: Hyeonseong
 * Modified By: Hyeonseong
 * copyright @ 2023 TeamDOT
 * --- ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---
 *              Description
 * Login, Sign RequestDto 정의
 * DB와 필드명 똑같이 해야함
 * userEmail, userPassword
 * 
 * 회원가입 Body
 * {
    "userUid":"heo",
    "userEmail":"heoyujin07@gmail.com",
    "userPassword":"1234",
    "userTel":"01099966462",
    "userRole":"USER"
}
 * --- ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---
 */
class SignReqDto {
  String userUid;
  String userEmail;
  String userPassword;
  String userTel;
  String userRole;

  SignReqDto({
    required this.userUid,
    required this.userEmail,
    required this.userPassword,
    required this.userTel,
    required this.userRole,
  });

  Map<String, dynamic> toJson() {
    return {
      "userUid": userUid,
      "userEmail": userEmail,
      "userPassword": userPassword,
      "userTel": userTel,
      "userRole": userRole,
    };
  }
}

class LoginReqDto {
  final String userEmail;
  final String userPassword;

  LoginReqDto({
    required this.userEmail,
    required this.userPassword,
  });

  Map<String, dynamic> toJson() {
    return {
      "userEmail": userEmail,
      "userPassword": userPassword,
    };
  }
}

// class UserNameCheckReqDto {
//   final String username;

//   UserNameCheckReqDto({required this.username});

//   Map<String, dynamic> toJson() {
//     return {
//       "username": username,
//     };
//   }
// }
