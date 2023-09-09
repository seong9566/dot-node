import 'package:dot_node/models/widget_element.dart';

/*
 * Project Name:  [DOTnode]
 * Created Date: 2023-08-28 
 * Last Modified: 2023-08-28
 * Author: Hyeonseong
 * Modified By: Hyeonseong
 * copyright @ 2023 TeamDOT
 * --- ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---
 *              Description
 * Widget의 요소 Update ReqDto
 * --- ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---
 */
class WidgetUpdateReqDto {
  int widgetId;
  String widgetName;
  List<WidgetElement> widgetElement;

  WidgetUpdateReqDto({
    required this.widgetId,
    required this.widgetName,
    required this.widgetElement,
  });

  factory WidgetUpdateReqDto.fromJson(Map<String, dynamic> json) => WidgetUpdateReqDto(
        widgetId: json["widgetId"],
        widgetName: json["widgetName"],
        widgetElement: List<WidgetElement>.from(json["widgetElement"].map((e) => WidgetElement.fromJson(e))),
      );

  Map<String, dynamic> toJson() => {
        "widgetId": widgetId,
        "widgetName": widgetName,
        "widgetElement": List<dynamic>.from(widgetElement.map((e) => e.toJson())),
      };
}
