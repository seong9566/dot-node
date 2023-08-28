/*
 * Project Name:  [DOTnode]
 * Created Date: 2023-08-22 
 * Last Modified: 2023-08-24
 * Author: Hyeonseong
 * Modified By: Hyeonseong
 * copyright @ 2023 TeamDOT
 * --- ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---
 *              Description
 * widget Delete
 * --- ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---
 */
class WidgetDeleteReqDto {
  int widgetId;

  WidgetDeleteReqDto({
    required this.widgetId,
  });

  factory WidgetDeleteReqDto.fromJson(Map<String, dynamic> json) => WidgetDeleteReqDto(
        widgetId: json["widgetId"],
      );

  Map<String, dynamic> toJson() => {
        "widgetId": widgetId,
      };
}
