import 'dart:convert';

import 'package:dot_node/models/widget_element.dart';

class WidgetGetRespDto {
  String widgetName;
  List<WidgetElement> widgetElement;

  WidgetGetRespDto({
    required this.widgetName,
    required this.widgetElement,
  });

  factory WidgetGetRespDto.fromJson(Map<String, dynamic> json) =>
      WidgetGetRespDto(
        widgetName: json["widgetName"],
        widgetElement: List<WidgetElement>.from(
            json["widgetElement"].map((x) => WidgetElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "widgetName": widgetName,
        "widgetElement":
            List<dynamic>.from(widgetElement.map((x) => x.toJson())),
      };
}
