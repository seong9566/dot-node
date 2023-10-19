import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/*
 * Project Name:  [DOTnode]
 * Created Date: 2023-10-09
 * Last Modified: 2023-10-11
 * Author: Hyeonseong
 * Modified By: Hyeonseong
 * copyright @ 2023 TeamDOT
 * --- ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---
 *              Description
 * 고정된 Bottom_nav_bar 
 * --- ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---
 */
class CustomBottomNav extends StatelessWidget {
  const CustomBottomNav({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: EdgeInsets.only(bottom: 100),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12), // 안쪽의 여백
            margin: const EdgeInsets.only(left: 24),
            decoration: BoxDecoration(
              color: Colors.grey.shade800,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "DOT",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Akira",
                    fontSize: 16.sp,
                  ),
                ),
                SizedBox(width: 10.w),
                SizedBox(
                  height: 8.h,
                  child: VerticalDivider(color: Colors.white),
                ),
                SizedBox(width: 10.w),
                Text(
                  "WORK",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Akira",
                    fontSize: 16.sp,
                  ),
                ),
                SizedBox(width: 10.w),
                SizedBox(
                  height: 8.h,
                  child: VerticalDivider(color: Colors.white),
                ),
                SizedBox(width: 10.w),
                Text(
                  "JOB",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Akira",
                    fontSize: 16.sp,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.zero,
            padding: EdgeInsets.zero,
            width: 30.w,
            height: 8.h,
            color: Colors.grey.shade800,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.grey.shade800,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
            ),
            child: Text(
              "MY PAGE",
              style: TextStyle(
                color: Colors.white,
                fontFamily: "Akira",
                fontSize: 16.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
