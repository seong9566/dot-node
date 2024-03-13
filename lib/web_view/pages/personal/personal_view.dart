import 'package:dot_node/component_widget/custom_marquee.dart';
import 'package:dot_node/component_widget/custom_search_bar.dart';
import 'package:dot_node/component_widget/dot_widget.dart';
import 'package:dot_node/core/route_page.dart';
import 'package:dot_node/dot_widgets/header_items.dart';
import 'package:dot_node/models/app_bar_model.dart';
import 'package:dot_node/util/ui/color_asset.dart';
import 'package:dot_node/util/ui/img_res.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// 새로 리뉴얼 한 Personal
class PersonalView extends StatefulWidget {
  const PersonalView({super.key});

  @override
  State<PersonalView> createState() => _PersonalViewState();
}

class _PersonalViewState extends State<PersonalView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomMarquee(
            items: [
              MarqueeTest(
                  dotChain: appBarTextList[0].dotChain,
                  str: appBarTextList[0].str),
            ],
          ),
          personalHeader(),
        ],
      ),
      bottomNavigationBar: PersonalBottomNav(),
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
                child: SvgPicture.asset(ImgRes.profilePath),
                // child: Image.asset(
                //   ImgRes.profilePath,
                //   fit: BoxFit.cover,
                // ),
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
}

class PersonalBottomNav extends StatefulWidget {
  const PersonalBottomNav({
    super.key,
  });

  @override
  State<PersonalBottomNav> createState() => _PersonalBottomNavState();
}

class _PersonalBottomNavState extends State<PersonalBottomNav> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: EdgeInsets.only(bottom: 20.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MouseRegion(
            onHover: (hover) {
              setState(() {
                //isHover = true;
              });
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
              width: 800.w,
              height: 120.h,
              decoration: BoxDecoration(
                color: Color(0xFFE9E9E9),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(80.r),
                  bottomRight: Radius.circular(80.r),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  bottomNavText(),
                  bottomNavIcons(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget bottomNavText() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.r, vertical: 12.r),
      width: 540.w,
      height: 80.h,
      decoration: BoxDecoration(
        color: DotColor.dotGray,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(60.r),
          bottomRight: Radius.circular(60.r),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          bottomNavTextBtn("PRIVATE", () {}),
          verticalDivider(),
          bottomNavTextBtn("EDIT", () {
            RoutePage.move(context, RoutePage.widgetUpdate);
          }),
          verticalDivider(),
        ],
      ),
    );
  }

  Widget bottomNavTextBtn(String text, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 24.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget verticalDivider() {
    return SizedBox(
      height: 28.h,
      child: VerticalDivider(color: Colors.white, thickness: 3),
    );
  }

  Widget bottomNavIcons() {
    return Row(
      children: [
        ...bottomDot(),
        bottomNavItem(CupertinoIcons.bell, () {}),
        ...bottomDot(),
        bottomNavItem(Icons.settings, () {}),
      ],
    );
  }

  Widget bottomNavItem(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 80.w,
        height: 80.h,
        decoration: BoxDecoration(
          color: DotColor.dotGray,
          borderRadius: BorderRadius.all(Radius.circular(50)),
        ),
        child: Icon(
          icon,
          size: 40.sp,
        ),
      ),
    );
  }
}
