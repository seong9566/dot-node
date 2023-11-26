import 'package:dot_node/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PeachesMainBanner extends StatelessWidget {
  const PeachesMainBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: searchBarColor,
      width: mdWidth,
      height: 400.h,
      child: Center(
        child: Text("Main Banner (Video)"),
      ),
    );
  }
}
