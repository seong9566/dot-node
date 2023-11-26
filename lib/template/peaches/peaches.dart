import 'package:dot_node/constant.dart';
import 'package:dot_node/core/util/custom_scroll_behavior.dart';
import 'package:dot_node/models/app_bar_model.dart';
import 'package:dot_node/template/peaches/components/explanation.dart';
import 'package:dot_node/template/peaches/components/main_banner.dart';
import 'package:dot_node/template/peaches/components/small_banner.dart';
import 'package:dot_node/template/peaches/components/sub_banner.dart';
import 'package:dot_node/web_view/pages/home/components/custom_marquee.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/*
 * Project Name:  [DOTnode]
 * Created Date: 2023-11-18
 * Last Modified: 2023-11-18
 * Author: Hyeonseong
 * Modified By: Hyeonseong
 * copyright @ 2023 TeamDOT
 * --- ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---
 *              Description
 * 프레임 워크만 생성
 * 기능 추가 필요 : VideoPlay,ImageView
 * 
 * --- ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---
 */
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
              PeachesMainBanner(),

              SizedBox(height: 12.h),

              //Explanation
              PeachesExplanation(),

              SizedBox(height: 40.w),

              //subBanner
              SubBanner(),
              SizedBox(height: 40.w),

              //smallBanner
              SmallBanner(),
            ],
          ),
        ),
      ),
    );
  }
}

//임시 데이터들
class SubBannerItems {
  String text;

  SubBannerItems(
    this.text,
  );
}

List<SubBannerItems> subBanners = [
  SubBannerItems("Video1"),
  SubBannerItems("Video2"),
  SubBannerItems("Video3"),
  SubBannerItems("Video4"),
  SubBannerItems("Video5"),
];

class SmallBannerItems {
  String text;

  SmallBannerItems(
    this.text,
  );
}

List<SubBannerItems> smallBanners = [
  SubBannerItems("Image1"),
  SubBannerItems("Image2"),
  SubBannerItems("Image3"),
  SubBannerItems("Image4"),
  SubBannerItems("Image5"),
  SubBannerItems("Image6"),
  SubBannerItems("Image7"),
  SubBannerItems("Image8"),
  SubBannerItems("Image9"),
  SubBannerItems("Image10"),
];
