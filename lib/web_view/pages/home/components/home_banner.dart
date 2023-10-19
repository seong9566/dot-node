import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logger/logger.dart';

import 'banner_content.dart';

/*
 * Project Name:  [DOTnode]
 * Created Date: 2023-10-09
 * Last Modified: 2023-10-11
 * Author: Hyeonseong
 * Modified By: Hyeonseong
 * copyright @ 2023 TeamDOT
 * --- ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---
 *              Description
 * Banner 위젯 주의사항
 * Stack위젯 사용의 특징을 주의해야함
 * 제일 위에 보이는 Banner가 User에겐 1번 Banner 이지만, Stack위젯 기준으로 4번(가장 위에 쌓여있음) Banner임 헷갈림 주의하기!
 * --- ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---
 */

class HomeBanner extends StatefulWidget {
  const HomeBanner({super.key});

  @override
  State<HomeBanner> createState() => _HomeBannerState();
}

class _HomeBannerState extends State<HomeBanner> with SingleTickerProviderStateMixin {
  double totalBannerWidth = 920.w;
  double totalBannerHeight = 360.h;
  int currentPage = 0;

  // late AnimationController _animationController;
  // bool isDragged = false;
  // @override
  // void initState() {
  //   super.initState();
  //   _animationController = AnimationController(
  //     vsync: this,
  //     duration: const Duration(milliseconds: 400),
  //   );
  //   super.initState();
  // }

  // @override
  // void dispose() {
  //   _animationController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {
            if (currentPage > 0) {
              // 현재 페이지가 0보다 크다면 --
              // 현재 페이지가 0과 같다면 3으로 돌아감.
              currentPage--;
            } else {
              currentPage = 3;
            }
          },
          icon: Icon(
            CupertinoIcons.back,
            color: Colors.black,
          ),
        ),
        SizedBox(
          width: totalBannerWidth,
          height: totalBannerHeight,
          child: Stack(
            children: [
              Positioned(
                left: 24,
                child: BannerContent(
                  "Banner 4",
                  color: Colors.grey.shade200,
                  onTap: () {
                    setState(() {});
                  },
                ),
              ),
              // 2번 배너
              Positioned(
                left: 16,
                child: BannerContent(
                  "Banner 3",
                  color: Colors.grey.shade300,
                  onTap: () {},
                ),
              ),
              // 3번 배너
              Positioned(
                left: 8,
                child: BannerContent(
                  "Banner 2",
                  color: Colors.grey.shade400,
                  onTap: () {},
                ),
              ),
              // 4번 배너
              Positioned(
                left: 0,
                child: BannerContent(
                  color: Colors.grey.shade500,
                  "Banner1",
                  onTap: () {},
                ),
              ),
              Positioned(
                bottom: 40,
                right: 0,
                left: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    //itemCount : 4
                    4,
                    (index) => AnimatedContainer(
                      duration: Duration(microseconds: 300),
                      margin: const EdgeInsets.only(right: 5),
                      height: 8.h,
                      width: currentPage == index ? 20.w : 8.w,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: () {
            setState(() {
              if (currentPage < 3) {
                // 현재 페이지가 3보다 작다면 ++
                // 현재 페이지가 3과 같다면 0으로 돌아감.
                currentPage++;
                Logger().d("currentPage = $currentPage");
              } else {
                currentPage = 0;
                Logger().d("currentPage = $currentPage");
              }
            });
          },
          icon: Icon(
            CupertinoIcons.forward,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
