/*
 * Project Name:  [DOTnode]
 * Created Date: 2023-06-17
 * Last Modified: 2023-08-24
 * Author: Hyeonseong
 * Modified By: Hyeonseong
 * copyright @ 2023 TeamDOT
 * --- ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---
 *              Description
 * Widget Class 원형
 * --- ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---
 */

class WidgetElement {
  int? elementId;
  String elementName;
  String content;
  dynamic imageFile;

  WidgetElement({
    this.elementId,
    required this.elementName,
    required this.content,
    this.imageFile,
  });

  factory WidgetElement.fromJson(Map<String, dynamic> json) => WidgetElement(
        elementId: json["elementId"],
        elementName: json["elementName"],
        content: json["content"],
        imageFile: json["imageFile"],
      );

  Map<String, dynamic> toJson() => {
        "elementId": elementId,
        "elementName": elementName,
        "content": content,
        "imageFile": imageFile,
      };
}
