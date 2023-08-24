import 'package:dot_node/models/widget_element.dart';

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
class WidgetInsertReqDto {
  String widgetName;
  String userUid;
  List<WidgetElement> widgetElement;

  WidgetInsertReqDto({
    required this.widgetName,
    required this.userUid, // youngmin
    required this.widgetElement,
  });

  factory WidgetInsertReqDto.fromJson(Map<String, dynamic> json) => WidgetInsertReqDto(
        widgetName: json["widgetName"],
        userUid: json["userUid"],
        widgetElement: List<WidgetElement>.from(json["widgetElement"].map((x) => WidgetElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "widgetName": widgetName,
        "userUid": userUid,
        "widgetElement": List<dynamic>.from(widgetElement.map((x) => x.toJson())),
      };
}
