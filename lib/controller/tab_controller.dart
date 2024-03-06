import 'package:flutter_riverpod/flutter_riverpod.dart';

final tabProvider = Provider((ref) => WidgetTabController(ref));

class WidgetTabController {
  final Ref ref;

  WidgetTabController(this.ref);

  DotWidget dotWidget = DotWidget.banner;

  void changeDotWidget(DotWidget dotWidget) {
    this.dotWidget = dotWidget;
  }
}

enum DotWidget { banner, layout, list }
