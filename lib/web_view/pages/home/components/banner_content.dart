import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/*
 * Project Name:  [DOTnode]
 * Created Date: 2023-10-11
 * Last Modified: 2023-10-11
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

class BannerContent extends StatefulWidget {
  BannerContent(
    this.content, {
    required this.color,
    this.onTap,
    super.key,
  });
  final Color color;
  final String? content;
  final VoidCallback? onTap;

  @override
  State<BannerContent> createState() => _BannerContentState();
}

class _BannerContentState extends State<BannerContent> {
  double bannerWidget = 880.0.w;
  double bannerHeight = 360.0.h;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: bannerWidget,
        height: bannerHeight,
        decoration: BoxDecoration(
          color: widget.color,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(240),
            bottomRight: Radius.circular(240),
            topLeft: Radius.circular(20),
            bottomLeft: Radius.circular(20),
          ),
        ),
        child: widget.content!.isNotEmpty
            ? Padding(
                padding: EdgeInsets.only(left: 60),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.content!,
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
