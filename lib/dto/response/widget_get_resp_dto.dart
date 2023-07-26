class WidgetGetRespDto {
  int widgetId;
  String widgetName;
  List<ResWidgetElement> widgetElement;

  WidgetGetRespDto({
    required this.widgetId,
    required this.widgetName,
    required this.widgetElement,
  });

  factory WidgetGetRespDto.fromJson(Map<String, dynamic> json) => WidgetGetRespDto(
        widgetId: json["widgetId"],
        widgetName: json["widgetName"],
        widgetElement: List<ResWidgetElement>.from(json["widgetElement"].map((x) => ResWidgetElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "widgetId": widgetId,
        "widgetName": widgetName,
        "widgetElement": List<dynamic>.from(widgetElement.map((x) => x.toJson())),
      };
}

class ResWidgetElement {
  int? elementId;
  String elementName;
  String content;
  dynamic imageId;
  dynamic imageFile;

  ResWidgetElement({
    this.elementId,
    required this.elementName,
    required this.content,
    this.imageId,
    this.imageFile,
  });

  factory ResWidgetElement.fromJson(Map<String, dynamic> json) => ResWidgetElement(
        elementId: json["elementId"],
        elementName: json["elementName"],
        content: json["content"],
        imageId: json["imageId"],
        imageFile: json["imageFile"],
      );

  Map<String, dynamic> toJson() => {
        "elementId": elementId,
        "elementName": elementName,
        "content": content,
        "imageId": imageId,
        "imageFile": imageFile,
      };
}
