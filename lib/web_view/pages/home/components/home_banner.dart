import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logger/logger.dart';

import '../../../../constant.dart';
import 'animated_banner_content.dart';

/*
 * Project Name:  [DOTnode]
 * Created Date: 2023-10-09
 * Last Modified: 2023-10-30
 * Author: Hyeonseong
 * Modified By: Hyeonseong
 * copyright @ 2023 TeamDOT
 * --- ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---
 *              Description
 * Banner 위젯 주의사항
 * Stack위젯 사용의 특징을 주의해야함
 * 제일 위에 보이는 Banner가 User에겐 1번 Banner 이지만, Stack위젯 기준으로 4번(가장 위에 쌓여있음) Banner임 헷갈림 주의하기!
 * 
 * 10.30 - Banner 위젯 Animated -> PageView.builder로 수정 
 * --- ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---
 */

class HomeBanner extends StatefulWidget {
  const HomeBanner({super.key});

  @override
  State<HomeBanner> createState() => _HomeBannerState();
}

class _HomeBannerState extends State<HomeBanner> {
  int currentPage = 0;
  final PageController _pageController = PageController(
    initialPage: 0,
  );
  List<Map<String, String>> bannerData = [
    {
      "text": "Banner1",
    },
    {
      "text": "Banner2",
    },
    {
      "text": "Banner3",
    },
    {
      "text": "Banner4",
    },
    {
      "text": "Banner5",
    },
  ];
  @override
  void initState() {
    super.initState();

    Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if (currentPage < 4) {
        currentPage++;
      } else {
        currentPage = 0;
      }

      _pageController.animateToPage(
        currentPage,
        duration: Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    });
  }

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
                  _pageController.jumpToPage(currentPage);
                } else {
                  currentPage = bannerData.length - 1;
                  _pageController.jumpToPage(currentPage);
                }
              });
            }),
        SizedBox(
          width: totalBannerWidth, // 920
          height: totalBannerHeight,
          child: Stack(
            children: [
              PageView.builder(
                pageSnapping: true,
                itemCount: bannerData.length,
                onPageChanged: (value) => setState(() {
                  currentPage = value;
                }),
                itemBuilder: (context, index) {
                  return BannerContent(
                    content: "${bannerData[index]['text']}",
                    currentPage: currentPage,
                    onTap: () {
                      Logger().d("Banner ${index + 1} 눌려짐");
                    },
                  );
                },
                controller: _pageController,
              ),

              // dotButton
              Positioned(
                bottom: 40.h,
                right: 0.w,
                left: 0.w,
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
                    _pageController.jumpToPage(currentPage);
                  } else {
                    currentPage = 0;
                    _pageController.jumpToPage(currentPage);
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
