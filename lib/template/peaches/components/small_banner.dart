import 'package:dot_node/constant.dart';
import 'package:dot_node/core/util/custom_scroll_behavior.dart';
import 'package:dot_node/template/peaches/peaches.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SmallBanner extends StatelessWidget {
  const SmallBanner({
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
    );
  }
}
