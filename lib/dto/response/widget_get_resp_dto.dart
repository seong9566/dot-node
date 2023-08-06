class WidgetGetRespDto {
  int widgetId;
  String widgetName;
  List<WidgetElement> widgetElement;

  WidgetGetRespDto({
    required this.widgetId,
    required this.widgetName,
    required this.widgetElement,
  });

  factory WidgetGetRespDto.fromJson(Map<String, dynamic> json) => WidgetGetRespDto(
        widgetId: json["widgetId"],
        widgetName: json["widgetName"],
        widgetElement: List<WidgetElement>.from(json["widgetElement"].map((x) => WidgetElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "widgetId": widgetId,
        "widgetName": widgetName,
        "widgetElement": List<dynamic>.from(widgetElement.map((x) => x.toJson())),
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

  factory WidgetElement.fromJson(Map<String, dynamic> json) => WidgetElement(
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
