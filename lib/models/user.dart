/*
 * Project Name:  [DOTnode]
 * Created Date: 2023-07-01
 * Last Modified: 2023-07-01
 * Author: Hyeonseong
 * Modified By: Hyeonseong
 * copyright @ 2023 TeamDOT
 * 
 * --- ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---
 *              Description
 * 유저의 model 
 * --- ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---
 */
class User {
  User({
    required this.username,
    required this.userPassword,
    required this.userEmail,
  });

  String username;
  String userPassword;
  String userEmail;

  factory User.fromJson(Map<String, dynamic> json) => User(
        username: json["username"],
        userPassword: json["userPassword"],
        userEmail: json["userEmail"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "password": userPassword,
        "email": userEmail,
      };
}
