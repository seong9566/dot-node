import 'package:dot_node/web_view/pages/personal/widget/banner_tab.dart';
import 'package:dot_node/web_view/pages/personal/widget/layout_tab.dart';
import 'package:dot_node/web_view/pages/personal/widget/list_tab.dart';
import 'package:dot_node/controller/tab_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/ui/color_asset.dart';

class WidgetItems extends ConsumerStatefulWidget {
  const WidgetItems({super.key});

  @override
  WidgetItemsState createState() => WidgetItemsState();
}

class WidgetItemsState extends ConsumerState {
  late DotWidget selectedDotWidget = DotWidget.banner;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final tabController = ref.read(tabProvider);

    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: [
          SizedBox(height: 12),
          tabBtn(tabController),
          SizedBox(height: 12),
          _body(selectedDotWidget),
        ],
      ),
    );
  }

  Widget tabBtn(WidgetTabController tabController) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        tabBtnItem("Banner", DotWidget.banner, tabController),
        verticalDivider(),
        tabBtnItem("Layout", DotWidget.layout, tabController),
        verticalDivider(),
        tabBtnItem("List", DotWidget.list, tabController),
      ],
    );
  }

  Widget verticalDivider() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      height: 20,
      child: VerticalDivider(
        color: DotColor.dotGray,
        thickness: 2,
      ),
    );
  }

  Widget tabBtnItem(
      String text, DotWidget dotWidget, WidgetTabController tabController) {
    final isSelected = dotWidget == selectedDotWidget;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedDotWidget = dotWidget;
        });
        tabController.dotWidget = dotWidget;
      },
      child: Text(
        text,
        style: TextStyle(
          fontSize: 18,
          color: isSelected
              ? DotColor.dotPrimary
              : Colors.black, // 선택된 Tab은 primary 색으로, 나머지는 검은색으로
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _body(DotWidget dotWidget) {
    switch (dotWidget) {
      case DotWidget.banner:
        return BannerTab();

      case DotWidget.layout:
        return LayoutTab();
      case DotWidget.list:
        return ListTab();
    }
  }
}
