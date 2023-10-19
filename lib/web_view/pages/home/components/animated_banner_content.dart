import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/*
 * Project Name:  [DOTnode]
 * Created Date: 2023-10-11
 * Last Modified: 2023-10-19
 * Author: Hyeonseong
 * Modified By: Hyeonseong
 * copyright @ 2023 TeamDOT
 * --- ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---
 *              Description
 * HomeBanner Content
 * 
 * 만약 모두 이동 애니메이션이 필요해진다면 , border,width등에 if문이 필요해진다.  
 * -> 시간 소요가 너무 많이 될 것 같으니 보류, 디자인 변경이 가능한지 물어보기.
 * --- ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---
 */

class AnimatedBannerContent extends StatelessWidget {
  const AnimatedBannerContent(
    this.content, {
    super.key,
    required this.currentPage,
    required this.color,
    required this.onTap,
    required this.width,
    required this.isPageZero,
  });

  final int currentPage;
  final Color color;
  final String? content;
  final VoidCallback onTap;
  final double width;
  final bool isPageZero;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 100),
        width: width,
        height: 360.h,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(240),
            bottomRight: Radius.circular(240),
            topLeft: Radius.circular(20),
            bottomLeft: Radius.circular(20),
          ),
        ),
        child: isPageZero
            ? Padding(
                padding: EdgeInsets.only(left: 60),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    content!,
                    //"MAIN BANNER IMAGE",
                    style: TextStyle(
                      fontFamily: "Akira",
                      fontWeight: FontWeight.bold,
                      fontSize: 22.sp,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            : SizedBox(),
      ),
    );
  }
}
