import 'package:dot_node/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BariMainBanner extends StatelessWidget {
  const BariMainBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      width: mdWidth,
      height: 400.h,
      child: Row(
        children: [
          //Expanded - 남는 공간을 최대로 차지함.
          Expanded(
            child: Container(
              //width: , width를 초기화 하지 않은 이유 : Row가 추가 될 때 마다 크기가 동적으로 줄어들기 때문.
              height: 400.h,
              color: Colors.red,
              child: Text("Main Banner"),
            ),
          ),
          Column(),
        ],
      ),
    );
  }
}
