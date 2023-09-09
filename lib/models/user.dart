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
  String uid;
  String userEmail;
  User({
    required this.uid,
    required this.userEmail,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        uid: json["uid"],
        userEmail: json["userEmail"],
      );

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "email": userEmail,
      };
}
