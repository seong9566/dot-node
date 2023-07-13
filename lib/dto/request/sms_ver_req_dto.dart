class SmsVerReqDto {
  String uid;
  String to;
  String content;
  SmsVerReqDto({
    required this.uid,
    required this.to,
    required this.content,
  });
  Map<String, dynamic> toJson() {
    return {
      "uid": uid,
      "to": to,
      "content": content,
    };
  }
}
