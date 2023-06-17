class WidgetElement {
  String elementName;
  String content;
  dynamic imageFile;

  WidgetElement({
    required this.elementName,
    required this.content,
    this.imageFile,
  });

  factory WidgetElement.fromJson(Map<String, dynamic> json) => WidgetElement(
        elementName: json["elementName"],
        content: json["content"],
        imageFile: json["imageFile"],
      );

  Map<String, dynamic> toJson() => {
        "elementName": elementName,
        "content": content,
        "imageFile": imageFile,
      };
}
