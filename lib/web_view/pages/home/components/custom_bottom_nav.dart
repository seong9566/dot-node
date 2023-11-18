import 'package:dot_node/web_view/pages/personal/personal_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

/*
 * Project Name:  [DOTnode]
 * Created Date: 2023-10-09
 * Last Modified: 2023-11-18
 * Author: Hyeonseong
 * Modified By: Hyeonseong
 * copyright @ 2023 TeamDOT
 * --- ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---
 *              Description
 * 고정된 Bottom_nav_bar 
 * 마우스 Hover시 Height가 늘어나는 효과가 필요함.
 * --- ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---
 */
class CustomBottomNav extends StatefulWidget {
  const CustomBottomNav({
    super.key,
  });

  @override
  State<CustomBottomNav> createState() => _CustomBottomNavState();
}

class _CustomBottomNavState extends State<CustomBottomNav> {
//  bool isHover = false;
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
              // height: isHover ? 300.h : 68.h,
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
                  NavTextArea(),
                  NavIconArea(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NavIconArea extends StatelessWidget {
  const NavIconArea({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          Positioned(
            left: 0.w,
            top: 0.h,
            bottom: 0.h,
            child: Align(
              child: Container(
                // 전체 NavContent의 길이 - NavContent 길이
                // 476 - 340 = 136
                width: 136.w,
                height: 12.h,
                color: Color(0xffD9D9D9),
              ),
            ),
          ),
          Positioned(
            left: 20.w,
            top: 0.h,
            bottom: 0.h,
            child: Align(
              child: InkWell(
                onTap: () {
                  Get.to(PersonalPage());
                },
                child: Container(
                  width: 52.w,
                  height: 52.h,
                  decoration: BoxDecoration(
                    color: Color(0xffD9D9D9),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(CupertinoIcons.person),
                ),
              ),
            ),
          ),
          Positioned(
            // 20(Position) + 52(Container) + 20 = 92
            // 88인 이유, 원래의 너비는 소수점 2자리 까지임, 전부 반올림을 해서 + - 오차 생김
            left: 88.w,
            top: 0.h,
            bottom: 0.h,
            child: Align(
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: 52.w,
                    height: 52.h,
                    decoration: BoxDecoration(
                      color: Color(0xffD9D9D9),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(CupertinoIcons.bell),
                  ),
                  Positioned(
                    top: 2.h,
                    right: 6.w,
                    child: Container(
                      height: 16.h,
                      width: 16.w,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFF4848),
                        shape: BoxShape.circle,
                        border: Border.all(width: 1.5.w, color: Colors.white),
                      ),
                      child: Center(
                        child: Text(
                          "3",
                          style: TextStyle(
                            fontSize: 8.sp,
                            height: 1.h,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NavTextArea extends StatelessWidget {
  const NavTextArea({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.r, vertical: 12.r),
      width: 340.w,
      height: 52.h,
      decoration: BoxDecoration(
        color: Color(0xffD9D9D9),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(34.r),
          bottomRight: Radius.circular(34.r),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(width: 14.w),
          Text(
            "DOT",
            style: TextStyle(
              color: Colors.white,
              //  fontFamily: "Akira",
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(width: 14.w),
          SizedBox(
            height: 16.h,
            child: VerticalDivider(color: Colors.white, thickness: 2),
          ),
          SizedBox(width: 14.w),
          Text(
            "WORK",
            style: TextStyle(
              color: Colors.white,
              // fontFamily: "Akira",
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(width: 14.w),
          SizedBox(
            height: 16.h,
            child: VerticalDivider(color: Colors.white, thickness: 2),
          ),
          SizedBox(width: 14.w),
          SizedBox(width: 34.w), //Text 대체 SizedBox
          // Text(
          //   "JOB",
          //   style: TextStyle(
          //     color: Colors.white,
          //     // fontFamily: "Akira",
          //     fontSize: 20.sp,
          //     fontWeight: FontWeight.bold,
          //   ),
          // ),
        ],
      ),
    );
  }
}
