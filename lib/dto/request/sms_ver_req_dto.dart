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

class SmsVerCheckReqDto {
  String uid;
  String from;
  String key;

  SmsVerCheckReqDto({
    required this.uid,
    required this.from,
    required this.key,
  });
  Map<String, dynamic> toJson() {
    return {
      "uid": uid,
      "from": from,
      "key": key,
    };
  }
}
