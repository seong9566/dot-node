import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import 'marquee_app_bar.dart';

class HomeScreenBody extends StatefulWidget {
  HomeScreenBody({super.key});

  @override
  State<HomeScreenBody> createState() => _HomeScreenBodyState();
}

int currentPage = 0;

class _HomeScreenBodyState extends State<HomeScreenBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          // home/components/custom_app_bar
          MarQueeAppBar(),
          SizedBox(height: 100),

          Stack(
            children: [
              // 1번 배너
              BannerContent(
                "",
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
                  "",
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
                  "",
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
                right: 130,
                child: BannerContent(
                  width: 1121,
                  height: 453,
                  color: Colors.grey.shade500,
                  "MAIN BANNER IMAGE",
                  onTap: () {
                    setState(() {
                      currentPage = 0;
                      Logger().d("index : $currentPage");
                    });
                  },
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
                      duration: Duration(microseconds: 100),
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
          ),
        ],
      ),
    );
  }
}

class BannerContent extends StatefulWidget {
  BannerContent(
    this.content, {
    required this.width,
    required this.height,
    required this.color,
    required this.onTap,
    super.key,
  });
  final double width, height;
  final Color color;
  final String? content;
  final VoidCallback onTap;

  @override
  State<BannerContent> createState() => _BannerContentState();
}

class _BannerContentState extends State<BannerContent> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: widget.width,
        height: widget.height,
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
                      fontSize: 22,
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
