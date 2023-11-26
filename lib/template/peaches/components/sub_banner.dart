import 'package:dot_node/constant.dart';
import 'package:dot_node/core/util/custom_scroll_behavior.dart';
import 'package:dot_node/template/peaches/peaches.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubBanner extends StatelessWidget {
  const SubBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
    );
  }
}
