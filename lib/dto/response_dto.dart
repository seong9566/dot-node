/*
 * Project Name:  [DOTnode]
 * Created Date: 2023-05-19
 * Last Modified: 2023-05-19
 * Author: Hyeonseong
 * Modified By: Hyeonseong
 * copyright @ 2023 TeamDOT
 * --- ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---
 *              Description
 * 서버와 통신할 때 json 형식으로 주고 받기 때문에 전달 할 때와 받을 때 fromJson,toJson
 * --- ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---
 */

class ResponseDto {
  final String? code;
  final String? msg;
  dynamic data;

  ResponseDto({this.code, this.msg, this.data});

  factory ResponseDto.fromJson(Map<String, dynamic> json) => ResponseDto(
        code: json["code"],
        msg: json["msg"],
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "msg": msg,
        "data": data,
      };
}
