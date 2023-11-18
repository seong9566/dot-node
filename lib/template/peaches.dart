import 'package:dot_node/constant.dart';
import 'package:dot_node/core/util/custom_scroll_behavior.dart';
import 'package:dot_node/models/app_bar_model.dart';
import 'package:dot_node/web_view/pages/home/components/custom_marquee.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PeachesTemplate extends StatefulWidget {
  const PeachesTemplate({super.key});

  @override
  State<PeachesTemplate> createState() => _PeachesTemplateState();
}

class _PeachesTemplateState extends State<PeachesTemplate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              CustomMarquee(
                items: [
                  MarqueeTest(dotChain: appBarTextList[0].dotChain, str: appBarTextList[0].str),
                ],
              ),
              SizedBox(height: 80.w),

              //video 영역
              Container(
                color: searchBarColor,
                width: mdWidth,
                height: 400.h,
                child: Center(
                  child: Text("Main Banner (Video)"),
                ),
              ),

              SizedBox(height: 12.h),

              //Explanation
              Container(
                width: mdWidth,
                height: 48.h,
                color: Colors.amber,
                child: Center(
                  child: Text("Explanation (Text)"),
                ),
              ),

              SizedBox(height: 40.w),

              //subBanner
              SizedBox(
                height: 200.h,
                child: ScrollConfiguration(
                  behavior: MyCustomScrollBehavior(),
                  child: ListView.builder(
                      physics: AlwaysScrollableScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: subBanners.length,
                      itemBuilder: (BuildContext context, index) {
                        return Container(
                          margin: EdgeInsets.only(right: 4.w),
                          width: mdWidth * 0.4,
                          height: 200.h,
                          color: Colors.blue,
                          child: Text(subBanners[index].text),
                        );
                      }),
                ),
              ),
              SizedBox(height: 40.w),

              //smallBanner
              SizedBox(
                height: 200.h,
                child: ScrollConfiguration(
                  behavior: MyCustomScrollBehavior(),
                  child: ListView.builder(
                      physics: AlwaysScrollableScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: smallBanners.length,
                      itemBuilder: (BuildContext context, index) {
                        return Container(
                          margin: EdgeInsets.only(right: 4.w),
                          width: mdWidth * 0.2,
                          height: 200.h,
                          color: Colors.brown,
                          child: Text(smallBanners[index].text),
                        );
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SubBanner {
  String text;

  SubBanner(
    this.text,
  );
}

List<SubBanner> subBanners = [
  SubBanner("Video1"),
  SubBanner("Video2"),
  SubBanner("Video3"),
  SubBanner("Video4"),
  SubBanner("Video5"),
];

class SmallBanner {
  String text;

  SmallBanner(
    this.text,
  );
}

List<SubBanner> smallBanners = [
  SubBanner("Image1"),
  SubBanner("Image2"),
  SubBanner("Image3"),
  SubBanner("Image4"),
  SubBanner("Image5"),
];
