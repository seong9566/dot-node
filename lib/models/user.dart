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
    required this.userEmail,
  });

  String username;
  String userEmail;

  factory User.fromJson(Map<String, dynamic> json) => User(
        username: json["username"],
        userEmail: json["userEmail"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "email": userEmail,
      };
}
