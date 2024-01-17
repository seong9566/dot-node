class Urls {
  static const String host = "https://node.o-r.kr:443"; // AWS

  /// POST - 회원가입
  static const String join = "/auth/join";

  /// GET - 토큰 체크 (자동 로그인)
  static const String tokenCheck = "/auth/refresh-token";

  /// GET - ID 중복 체크 - Query 있음
  static const String idCheck = "/auth/check-id/";

  /// POST - SMS 인증
  static const String smsNaver = "/auth/sms-naver";

  /// POST - Email 인증
  static const String email = "/auth/email";

  /// POST - KeyCheck
  static const String keyCheck = "/auth/check-key";

  /// POST - 로그인
  static const String login = "/auth/login";

  /// POST - 위젯 작성
  static const String createWidget = "/widget";

  /// PUT - 위젯 수정
  static const String updateWidget = "/widget";

  /// GET - 위젯 조회 (쿼리 있음)
  static const String getWidget = "widget";

  /// DELETE - 위젯 삭제
  static const String deleteWidget = "/widget";
}
