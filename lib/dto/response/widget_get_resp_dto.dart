// To parse this JSON data, do
//
//     final welcome = welcomeFromMap(jsonString);

import 'dart:convert';

WidgetGetRespDto welcomeFromMap(String str) => WidgetGetRespDto.fromJson(json.decode(str));

String welcomeToMap(WidgetGetRespDto data) => json.encode(data.toJson());

class WidgetGetRespDto {
  List<WidgetList> data;
  PageInfo pageInfo;

  WidgetGetRespDto({
    required this.data,
    required this.pageInfo,
  });

  factory WidgetGetRespDto.fromJson(Map<String, dynamic> json) => WidgetGetRespDto(
        data: List<WidgetList>.from(json["data"].map((x) => WidgetList.fromMap(x))),
        pageInfo: PageInfo.fromMap(json["pageInfo"]),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
        "pageInfo": pageInfo.toMap(),
      };
}

class WidgetList {
  int widgetId;
  String widgetName;
  List<WidgetElement> widgetElement;

  WidgetList({
    required this.widgetId,
    required this.widgetName,
    required this.widgetElement,
  });

  factory WidgetList.fromMap(Map<String, dynamic> json) => WidgetList(
        widgetId: json["widgetId"],
        widgetName: json["widgetName"],
        widgetElement: List<WidgetElement>.from(json["widgetElement"].map((x) => WidgetElement.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "widgetId": widgetId,
        "widgetName": widgetName,
        "widgetElement": List<dynamic>.from(widgetElement.map((x) => x.toMap())),
      };
}

class WidgetElement {
  int elementId;
  String elementName;
  String content;
  dynamic imageId;
  dynamic imageFile;

  WidgetElement({
    required this.elementId,
    required this.elementName,
    required this.content,
    this.imageId,
    this.imageFile,
  });

  factory WidgetElement.fromMap(Map<String, dynamic> json) => WidgetElement(
        elementId: json["elementId"],
        elementName: json["elementName"],
        content: json["content"],
        imageId: json["imageId"],
        imageFile: json["imageFile"],
      );

  Map<String, dynamic> toMap() => {
        "elementId": elementId,
        "elementName": elementName,
        "content": content,
        "imageId": imageId,
        "imageFile": imageFile,
      };
}

class PageInfo {
  int page;
  int size;
  int totalResult;
  int totalPage;

  PageInfo({
    required this.page,
    required this.size,
    required this.totalResult,
    required this.totalPage,
  });

  factory PageInfo.fromMap(Map<String, dynamic> json) => PageInfo(
        page: json["page"],
        size: json["size"],
        totalResult: json["totalResult"],
        totalPage: json["totalPage"],
      );

  Map<String, dynamic> toMap() => {
        "page": page,
        "size": size,
        "totalResult": totalResult,
        "totalPage": totalPage,
      };
}
