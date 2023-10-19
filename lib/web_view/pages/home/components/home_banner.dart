import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'animated_banner_content.dart';

/*
 * Project Name:  [DOTnode]
 * Created Date: 2023-10-09
 * Last Modified: 2023-10-19
 * Author: Hyeonseong
 * Modified By: Hyeonseong
 * copyright @ 2023 TeamDOT
 * --- ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---
 *              Description
 * Banner 위젯 주의사항
 * Stack위젯 사용의 특징을 주의해야함
 * 제일 위에 보이는 Banner가 User에겐 1번 Banner 이지만, Stack위젯 기준으로 4번(가장 위에 쌓여있음) Banner임 헷갈림 주의하기!
 * 
 * 10.19일 
 * <이슈 사항> - 회의 때 말하기
 * Banner를 Position으로 위치 선정 시 1번 -> 2번 배너로 넘어갈 때 SizedBox크기를 0 으로 주니 왼쪽 빈 공간이 자꾸 늘어나는것 처럼 보임
 * <해결 방안>
 * - Position으로 위치를 선정 하지 않고, Banner의 크기만 조절 Ex) Banner의 크기가 8씩 늘어나도록 함.
 * 
 * --- ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---
 */

class HomeBanner extends StatefulWidget {
  const HomeBanner({super.key});

  @override
  State<HomeBanner> createState() => _HomeBannerState();
}

class _HomeBannerState extends State<HomeBanner> {
  double totalBannerWidth = 920.w;
  double totalBannerHeight = 360.h;
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BannerSideBtn(
            icon: Icon(
              CupertinoIcons.back,
              color: Colors.black,
            ),
            onPressed: () {
              setState(() {
                if (currentPage > 0) {
                  currentPage--;
                } else {
                  currentPage = 4;
                }
              });
            }),
        // SizedBox(
        //   width: totalBannerWidth,
        //   height: totalBannerHeight,
        //   child: Stack(
        //     children: [
        //       // 4번 배너
        //       Positioned(
        //         left: 24,
        //         child: AnimatedBannerContent(
        //           "Banner 4",
        //           onTap: () {},
        //           currentPage: currentPage,
        //           color: Colors.grey.shade200,
        //           width: 880.w,
        //           isPageZero: true,
        //         ),
        //       ),
        //       // 3번 배너
        //       Positioned(
        //         left: 16,
        //         child: AnimatedBannerContent(
        //           "Banner 3",
        //           onTap: () {},
        //           currentPage: currentPage,
        //           color: Colors.grey.shade300,
        //           width: currentPage == 1 || currentPage == 0 || currentPage == 2 ? 880.w : 0.w,
        //           isPageZero: currentPage == 1 || currentPage == 0 || currentPage == 2 ? true : false,
        //         ),
        //       ),
        //       // 2번 배너
        //       Positioned(
        //         left: 8,
        //         child: AnimatedBannerContent(
        //           "Banner 2",
        //           currentPage: currentPage,
        //           color: Colors.grey.shade400,
        //           onTap: () {},
        //           width: currentPage == 1 || currentPage == 0 ? 880.w : 0.w,
        //           isPageZero: currentPage == 1 || currentPage == 0 ? true : false,
        //         ),
        //       ),
        //       // 1번 배너
        //       Positioned(
        //         left: 0,
        //         child: AnimatedBannerContent(
        //           "Banner 1",
        //           currentPage: currentPage,
        //           color: Colors.grey.shade500,
        //           onTap: () {},
        //           width: currentPage == 0 ? 880.w : 0.w,
        //           isPageZero: currentPage == 0 ? true : false,
        //         ),
        //       ),

        //       // dotButton
        //       Positioned(
        //         bottom: 40,
        //         right: 0,
        //         left: 0,
        //         child: Row(
        //           mainAxisAlignment: MainAxisAlignment.center,
        //           children: List.generate(
        //             4,
        //             (index) => AnimatedDot(
        //               currentPage: currentPage,
        //               index: index,
        //             ),
        //           ),
        //         ),
        //       ),
        //     ],
        //   ),
        // ),

        // Position을 지우고 Container의 width로만 정의 한 Banner
        SizedBox(
          width: totalBannerWidth, // 920
          height: totalBannerHeight,
          child: Stack(
            children: [
              // 5번 배너
              AnimatedBannerContent(
                "Banner 5",
                onTap: () {},
                currentPage: currentPage,
                color: Colors.grey.shade400,
                width: totalBannerWidth,
                isPageZero: true,
              ),
              // 4번 배너
              AnimatedBannerContent(
                "Banner 4",
                onTap: () {},
                currentPage: currentPage,
                color: Colors.grey.shade500,
                width: currentPage == 0 || currentPage == 1 || currentPage == 2 || currentPage == 3 ? totalBannerWidth - 8 : 0.w,
                isPageZero: currentPage == 0 || currentPage == 1 || currentPage == 2 || currentPage == 3 ? true : false,
              ),
              // 3번 배너
              AnimatedBannerContent(
                "Banner 3",
                onTap: () {},
                currentPage: currentPage,
                color: Colors.grey.shade600,
                width: currentPage == 0 || currentPage == 1 || currentPage == 2 ? totalBannerWidth - 16 : 0.w,
                isPageZero: currentPage == 0 || currentPage == 1 || currentPage == 2 ? true : false,
              ),
              // 2번 배너
              AnimatedBannerContent(
                "Banner 2",
                currentPage: currentPage,
                color: Colors.grey.shade700,
                onTap: () {},
                width: currentPage == 0 || currentPage == 1 ? totalBannerWidth - 24 : 0.w,
                isPageZero: currentPage == 0 || currentPage == 1 ? true : false,
              ),
              // 1번 배너
              AnimatedBannerContent(
                "Banner 1",
                currentPage: currentPage,
                color: Colors.grey.shade800,
                onTap: () {},
                width: currentPage == 0 ? totalBannerWidth - 32 : 0.w,
                isPageZero: currentPage == 0 ? true : false,
              ),

              // dotButton
              Positioned(
                bottom: 40,
                right: 0,
                left: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    5,
                    (index) => AnimatedDot(
                      currentPage: currentPage,
                      index: index,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        BannerSideBtn(
            icon: Icon(
              CupertinoIcons.forward,
              color: Colors.black,
            ),
            onPressed: () {
              setState(
                () {
                  if (currentPage < 4) {
                    currentPage++;
                  } else {
                    currentPage = 0;
                  }
                },
              );
            })
      ],
    );
  }
}

class AnimatedDot extends StatelessWidget {
  const AnimatedDot({
    super.key,
    required this.currentPage,
    required this.index,
  });

  final int currentPage;
  final int index;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 100),
      margin: const EdgeInsets.only(right: 8),
      height: 8.h,
      width: currentPage == index ? 20.w : 8.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}

class BannerSideBtn extends StatelessWidget {
  const BannerSideBtn({
    required this.onPressed,
    required this.icon,
    super.key,
  });

  final VoidCallback onPressed;
  final Icon icon;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: icon,
    );
  }
}
