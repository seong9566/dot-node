import 'package:dot_node/constant.dart';
import 'package:dot_node/models/app_bar_model.dart';
import 'package:dot_node/template/bari/components/main_banner.dart';
import 'package:dot_node/template/bari/components/small_banner.dart';
import 'package:dot_node/template/bari/components/sub_banner.dart';
import 'package:dot_node/template/peaches/peaches.dart';
import 'package:dot_node/web_view/pages/home/components/custom_marquee.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BariTemplate extends StatefulWidget {
  const BariTemplate({super.key});

  @override
  State<BariTemplate> createState() => _BariTemplateState();
}

class _BariTemplateState extends State<BariTemplate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomMarquee(
              items: [
                MarqueeTest(dotChain: appBarTextList[0].dotChain, str: appBarTextList[0].str),
              ],
            ),
            SizedBox(height: 80.w),
            BariMainBanner(),
            SizedBox(height: 20.h),
            BariSubBanner(),
            SizedBox(height: 20.h),
            BariSmallBanner(),
            SizedBox(height: 20.h),

            // Row + Column
            SizedBox(
              width: mdWidth,
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      //width: , width를 초기화 하지 않은 이유 : Row가 추가 될 때 마다 크기가 동적으로 줄어들기 때문.
                      height: 320.h,
                      color: Colors.red,
                      child: Text("Main Banner"),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        Container(
                          color: Colors.blueAccent,
                          height: 100.h,
                        ),
                        SizedBox(height: 10.h),
                        Container(
                          color: Colors.blueAccent,
                          height: 100.h,
                        ),
                        SizedBox(height: 10.h),
                        Container(
                          color: Colors.blueAccent,
                          height: 100.h,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: SizedBox(
          width: mdWidth,
          height: 90.h,
          child: Column(
            children: [
              Container(
                height: 40.h,
                color: Colors.grey,
                child: Center(
                  child: Icon(Icons.add),
                ),
              ),
              SizedBox(height: 10.h),
              Container(
                height: 40.h,
                color: Colors.blueGrey,
                child: Center(
                  child: Text("Widget Expanded"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
