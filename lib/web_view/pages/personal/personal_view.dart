import 'package:dot_node/core/route_page.dart';
import 'package:dot_node/core/ui/color_asset.dart';
import 'package:dot_node/core/ui/img_res.dart';
import 'package:dot_node/models/app_bar_model.dart';
import 'package:dot_node/widget/custom_marquee.dart';
import 'package:dot_node/widget/custom_search_bar.dart';
import 'package:dot_node/widget/dot_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
                child: Image.asset(
                  ImgRes.profilePath,
                  fit: BoxFit.cover,
                ),
              ),
              CustomSearchBar(),
            ],
          ),
          Container(
            height: 266.h,
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
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
              width: 492.w,
              height: 68.h,
              decoration: BoxDecoration(
                color: Color(0xFFE9E9E9),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(34.r),
                  bottomRight: Radius.circular(34.r),
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
      width: 340.w,
      height: 52.h,
      decoration: BoxDecoration(
        color: DotColor.dotGray,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(34.r),
          bottomRight: Radius.circular(34.r),
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

  GestureDetector bottomNavTextBtn(String text, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 18.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget verticalDivider() {
    return SizedBox(
      height: 16.h,
      child: VerticalDivider(color: Colors.white, thickness: 2),
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
        width: 50.w,
        height: 50.h,
        decoration: BoxDecoration(
          color: DotColor.dotGray,
          borderRadius: BorderRadius.all(Radius.circular(50)),
        ),
        child: Icon(icon, size: 28.sp),
      ),
    );
  }
}
