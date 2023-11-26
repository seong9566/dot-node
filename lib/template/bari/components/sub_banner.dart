import 'package:dot_node/constant.dart';
import 'package:dot_node/template/peaches/peaches.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BariSubBanner extends StatelessWidget {
  const BariSubBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ListView.builder(
        shrinkWrap: true,
        itemCount: subBanners.length,
        itemBuilder: (context, index) => Container(
          margin: EdgeInsets.only(bottom: 20),
          width: mdWidth,
          height: 200.h,
          color: Colors.green,
          child: Text(subBanners[index].text),
        ),
      ),
    ]);
  }
}
