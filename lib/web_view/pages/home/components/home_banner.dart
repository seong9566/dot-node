import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import 'banner_content.dart';

class HomeBanner extends StatefulWidget {
  const HomeBanner({super.key});

  @override
  State<HomeBanner> createState() => _HomeBannerState();
}

class _HomeBannerState extends State<HomeBanner> with SingleTickerProviderStateMixin {
  int currentPage = 0;
  //bool isSlide = false;
  late AnimationController _animationController;
  bool isDragged = false;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    super.initState();
  }

  void _handleDragStart() {
    setState(() {
      isDragged = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // 1번 배너
        BannerContent(
          "Banner 4",
          width: 1266,
          height: 453,
          color: Colors.grey.shade200,
          onTap: () {
            setState(() {
              Logger().d("index : $currentPage");
              currentPage = 3;
            });
          },
        ),
        // 2번 배너
        Positioned(
          right: 30,
          child: BannerContent(
            "Banner 3",
            width: 1121,
            height: 453,
            color: Colors.grey.shade300,
            onTap: () {
              setState(() {
                Logger().d("index : $currentPage");
                currentPage = 2;
              });
            },
          ),
        ),
        // 3번 배너
        Positioned(
          right: 80,
          child: BannerContent(
            "Banner 2",
            width: 1121,
            height: 453,
            color: Colors.grey.shade400,
            onTap: () {
              setState(() {
                Logger().d("index : $currentPage");
                currentPage = 1;
              });
            },
          ),
        ),
        // 4번 배너
        Positioned(
          left: 30,
          child: GestureDetector(
            onTap: () {
              // setState(() {
              //   Logger().d("index : $currentPage");
              //   currentPage = 1;
              //   if (currentPage == 1) {
              //     _animationController.forward();
              //   } else {
              //     _animationController.reverse();
              //   }
              // });
              setState(() {
                currentPage = 0;
              });
            },
            child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              width: currentPage == 0 ? 1121 : 40,
              height: 453,
              decoration: BoxDecoration(
                color: Colors.grey.shade500,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(240),
                  bottomRight: Radius.circular(240),
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
              ),
              child: currentPage == 0
                  ? Padding(
                      padding: EdgeInsets.only(left: 60),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "MAIN BANNER IMAGE",
                          style: TextStyle(
                            fontFamily: "Akira",
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  : SizedBox(),
            ),
          ),
          // child: BannerContent(
          //   width: 1121,
          //   height: 453,
          //   color: Colors.grey.shade500,
          //   "MAIN BANNER IMAGE",
          //   onTap: () {
          //     setState(() {
          //       currentPage = 0;
          //       Logger().d("index : $currentPage");
          //     });
          //   },
          // ),
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
                height: 8,
                width: currentPage == index ? 20 : 8,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
