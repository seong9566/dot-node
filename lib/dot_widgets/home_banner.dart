import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logger/logger.dart';
import '../constant.dart';

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
      "text": "Banner 1",
    },
    {
      "text": "Banner 2",
    },
    {
      "text": "Banner 3",
    },
    {
      "text": "Banner 4",
    },
    {
      "text": "Banner 5",
    },
  ];
  @override
  void initState() {
    super.initState();

    // 자동 스크롤
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
                  return bannerWidget(
                    "${bannerData[index]['text']}",
                    () {
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

  Widget bannerWidget(String content, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 100),
        width: totalBannerHeight,
        height: 360.h,
        decoration: BoxDecoration(
          color: Colors.grey.shade800,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(240),
            bottomRight: Radius.circular(240),
            topLeft: Radius.circular(20),
            bottomLeft: Radius.circular(20),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 60),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              content,
              style: TextStyle(
                fontFamily: "Akira",
                fontWeight: FontWeight.bold,
                fontSize: 22.sp,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Banner Dot
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

// Banner Side Btn
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
