// {
//     "uid":"heo",
//     "to":"heoyujin07@gmail.com",
//     "title":"테스트 발송"
// }
class EmailVerReqDto {
  String uid;
  String to;
  String title;
  EmailVerReqDto({
    required this.uid,
    required this.to,
    required this.title,
  });
  Map<String, dynamic> toJson() {
    return {
      "uid": uid,
      "to": to,
      "title": title,
    };
  }
}
