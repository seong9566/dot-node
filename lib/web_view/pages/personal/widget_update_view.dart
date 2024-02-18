import 'package:dot_node/core/ui/color_asset.dart';
import 'package:dot_node/core/ui/img_res.dart';
import 'package:dot_node/models/app_bar_model.dart';
import 'package:dot_node/web_view/pages/personal/widget/template_items.dart';
import 'package:dot_node/web_view/pages/personal/widget/widget_items.dart';
import 'package:dot_node/web_view/pages/personal/page_controller.dart';
import 'package:dot_node/widget/custom_marquee.dart';
import 'package:dot_node/widget/custom_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WidgetUpdateView extends ConsumerStatefulWidget {
  const WidgetUpdateView({super.key});

  @override
  WidgetUpdateViewState createState() => WidgetUpdateViewState();
}

class WidgetUpdateViewState extends ConsumerState
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  bool isWidget = true;
  bool isTemplates = false;
  @override
  void initState() {
    super.initState();
    tabController = TabController(
      length: 2,
      vsync: this,
      animationDuration: Duration(milliseconds: 400),
    );
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final animationPageController = ref.watch(animationPageProvider);
    return Scaffold(
        body: Column(
      children: [
        Column(
          children: [
            customAppBar(),
            personalHeader(),
            widthDivider(),
            selectWidgetAndTemplates(animationPageController),
          ],
        ),
        _body(animationPageController),
      ],
    ));
  }

  Widget customAppBar() {
    return CustomMarquee(
      items: [
        MarqueeTest(
            dotChain: appBarTextList[0].dotChain, str: appBarTextList[0].str),
      ],
    );
  }

  Widget selectWidgetAndTemplates(
      AnimationPageController animationPageController) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              animationPageController.back();
              isWidget = true;
              isTemplates = false;
            });
          },
          child: Container(
            width: 160.w,
            padding: EdgeInsets.symmetric(vertical: 16),
            decoration: BoxDecoration(
              color: isWidget ? DotColor.dotPrimary : DotColor.dotGray,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Text(
              "Widgets",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: isWidget ? DotColor.dotWhite : DotColor.dotBlack),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        ...bottomDot(),
        GestureDetector(
          onTap: () {
            setState(() {
              animationPageController.next();

              isWidget = false;
              isTemplates = true;
            });
          },
          child: Container(
            width: 160.w,
            padding: EdgeInsets.symmetric(vertical: 16),
            decoration: BoxDecoration(
              color: isTemplates ? DotColor.dotPrimary : DotColor.dotGray,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                bottomLeft: Radius.circular(30),
              ),
            ),
            child: Text(
              "Templates",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: isTemplates ? DotColor.dotWhite : DotColor.dotBlack),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }

  Widget widthDivider() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
      height: 5,
      width: double.infinity,
      color: DotColor.dotBlack,
    );
  }

  Widget personalHeader() {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 60.w,
                height: 60.h,
                child: Image.asset(
                  ImgRes.profilePath,
                  fit: BoxFit.cover,
                ),
              ),
              CustomSearchBar(),
            ],
          ),
          Container(
            height: 266,
            decoration: BoxDecoration(
              color: DotColor.dotGray,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "HI!",
                  style: TextStyle(
                    fontSize: 223,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "배너 위젯\n큰 이미지나 영상으로\n사람들의 이목을 끌 수 있습니다 !",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _body(AnimationPageController animationPageController) {
    return Expanded(
      child: Stack(
        children: [
          AnimatedPositioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: animationPageController.top,
            duration: animationPageController.animationDuration,
            child: AnimatedOpacity(
              opacity: animationPageController.opacity,
              duration: animationPageController.animationDuration,
              child: pages()[animationPageController.pageNum],
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> pages() {
    return [
      WidgetItems(),
      TemplateItems(),
    ];
  }

  List<Container> bottomDot() {
    return [
      Container(
        margin: EdgeInsets.symmetric(horizontal: 2),
        width: 5,
        height: 5,
        decoration: BoxDecoration(
          color: DotColor.dotGray,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
      ),
      Container(
        margin: EdgeInsets.symmetric(horizontal: 2),
        width: 5,
        height: 5,
        decoration: BoxDecoration(
          color: DotColor.dotGray,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
      ),
    ];
  }
}
