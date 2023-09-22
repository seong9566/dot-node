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
  int? imageId;
  String? imageFile;

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

//dumyData
List<WidgetGetRespDto> dumyData = [
  WidgetGetRespDto(
    widgetId: 1,
    widgetName: "ContainerWidget",
    widgetElement: [
      ResWidgetElement(
        elementId: 1,
        elementName: "title",
        content: "Container1 Title",
      ),
      ResWidgetElement(
        elementId: 2,
        elementName: "content",
        content: "Container1 content",
        imageFile: "assets/image1.jpeg",
      ),
    ],
  ),
  WidgetGetRespDto(
    widgetId: 2,
    widgetName: "ContainerWidget",
    widgetElement: [
      ResWidgetElement(
        elementId: 3,
        elementName: "title",
        content: "Container2 title(1)",
      ),
      ResWidgetElement(
        elementId: 4,
        elementName: "content",
        content: "Container2 content(1)",
        imageFile: "assets/image2.jpeg",
      ),
    ],
  ),
];
