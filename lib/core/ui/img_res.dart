class ImgRes {
  static final ImgRes _imgRes = ImgRes._internal();
  factory ImgRes() {
    return _imgRes;
  }
  ImgRes._internal();

  static const profilePath = "assets/profile.png";

  static Map<String, String> pill = {
    ImgStatus.def: profilePath,
    ImgStatus.selected: profilePath
  };
}

class ImgStatus {
  static const String def = "default";
  static const String selected = "selected";
}
