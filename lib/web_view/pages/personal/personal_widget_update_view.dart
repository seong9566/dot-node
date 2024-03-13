import 'package:dot_node/component_widget/custom_marquee.dart';
import 'package:dot_node/component_widget/custom_search_bar.dart';
import 'package:dot_node/dot_widgets/header_items.dart';
import 'package:dot_node/models/app_bar_model.dart';
import 'package:dot_node/util/ui/color_asset.dart';
import 'package:dot_node/util/ui/img_res.dart';
import 'package:dot_node/web_view/pages/personal/page_controller.dart';
import 'package:dot_node/web_view/pages/personal/widget/template_items.dart';
import 'package:dot_node/web_view/pages/personal/widget/widget_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PersonalWidgetUpdateView extends ConsumerStatefulWidget {
  const PersonalWidgetUpdateView({super.key});

  @override
  PersonalWidgetUpdateViewState createState() =>
      PersonalWidgetUpdateViewState();
}

class PersonalWidgetUpdateViewState extends ConsumerState {
  bool isWidget = true;
  bool isTemplates = false;

  @override
  Widget build(BuildContext context) {
    final animationPageController = ref.watch(animationPageProvider);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _appBar(),
            _header(),
            rowDivider(),
            widgetAndTemplateBtn(animationPageController),
            pages(animationPageController.pageNum),
          ],
        ),
      ),
    );
  }

  Widget pages(int pageNum) {
    if (pageNum == 0) {
      return WidgetItems();
    } else {
      return TemplateItems();
    }
  }

  Widget widgetAndTemplateBtn(AnimationPageController animationPageController) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {},
          child: Container(
            width: 240.w,
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
            width: 240.w,
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

  Widget rowDivider() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
      height: 5,
      width: double.infinity,
      color: DotColor.dotBlack,
    );
  }

  Widget _header() {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ///임시 프로필 아이콘 -> 나중에 변경 필요
              CircleAvatar(
                backgroundImage: AssetImage(ImgRes.profilePath),
              ),
              CustomSearchBar(),
            ],
          ),
          SizedBox(height: 40.h),
          HeaderItems().bannerHeaderWidget(),
        ],
      ),
    );
  }

  Widget _appBar() {
    return CustomMarquee(
      items: [
        MarqueeTest(
            dotChain: appBarTextList[0].dotChain, str: appBarTextList[0].str),
      ],
    );
  }
}
