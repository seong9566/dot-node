/*
 * Project Name:  [DOTnode]
 * Created Date: 2023-05-19
 * Last Modified: 2023-05-19
 * Author: Hyeonseong
 * Modified By: Hyeonseong
 * copyright @ 2023 TeamDOT
 * --- ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---
 *              Description
 * Login, Sign RequestDto 정의
 * DB와 필드명 똑같이 해야함
 * userEmail, userPassword
 * --- ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---
 */
class SignReqDto {
  final String username;
  final String userEmail;
  final String userPassword;

  SignReqDto({
    required this.username,
    required this.userEmail,
    required this.userPassword,
  });

  Map<String, dynamic> toJson() {
    return {
      "username": username,
      "userEmail": userEmail,
      "userPassword": userPassword,
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
