import 'dart:convert';

/*
 * Project Name:  [DOTnode]
 * Created Date: 2023-06-10 
 * Last Modified: 2023-06-10
 * Author: Hyeonseong
 * Modified By: Hyeonseong
 * copyright @ 2023 TeamDOT
 * --- ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---
 *              Description
 * Widget의 요소 Insert ReqDto
 * --- ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---
 */
WidgetInsertReqDto welcomeFromJson(String str) =>
    WidgetInsertReqDto.fromJson(json.decode(str));

String welcomeToJson(WidgetInsertReqDto data) => json.encode(data.toJson());

class WidgetInsertReqDto {
  String widgetName;
  String userUid;
  List<WidgetElement> widgetElement;

  WidgetInsertReqDto({
    required this.widgetName,
    required this.userUid, // youngmin
    required this.widgetElement,
  });

  factory WidgetInsertReqDto.fromJson(Map<String, dynamic> json) =>
      WidgetInsertReqDto(
        widgetName: json["widgetName"],
        userUid: json["userUid"],
        widgetElement: List<WidgetElement>.from(
            json["widgetElement"].map((x) => WidgetElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "widgetName": widgetName,
        "userUid": userUid,
        "widgetElement":
            List<dynamic>.from(widgetElement.map((x) => x.toJson())),
      };
}

class WidgetElement {
  String elementName;
  String content;

  WidgetElement({
    required this.elementName,
    required this.content,
  });

  factory WidgetElement.fromJson(Map<String, dynamic> json) => WidgetElement(
        elementName: json["elementName"],
        content: json["content"],
      );

  Map<String, dynamic> toJson() => {
        "elementName": elementName,
        "content": content,
      };
}
