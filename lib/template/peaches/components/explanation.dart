import 'package:dot_node/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PeachesExplanation extends StatelessWidget {
  const PeachesExplanation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: mdWidth,
      height: 48.h,
      color: Colors.amber,
      child: Center(
        child: Text("Explanation (Text)"),
      ),
    );
  }
}
