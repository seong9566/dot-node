class LoginModel {
  String code;
  String msg;
  String? jwtToken;
  String? refreshToken;
  LoginData data;

  LoginModel({
    this.jwtToken,
    this.refreshToken,
    required this.code,
    required this.msg,
    required this.data,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        code: json["code"],
        msg: json["msg"],
        data: LoginData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "msg": msg,
        "data": data.toJson(),
      };
}

class LoginData {
  String uid;
  String id;
  String email;

  LoginData({
    required this.uid,
    required this.id,
    required this.email,
  });

  factory LoginData.fromJson(Map<String, dynamic> json) => LoginData(
        uid: json["uid"],
        id: json["id"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "id": id,
        "email": email,
      };
}
