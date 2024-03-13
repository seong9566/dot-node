import 'package:dot_node/util/ui/color_asset.dart';
import 'package:flutter/material.dart';

class HeaderItems {
  Widget bannerHeaderWidget() {
    return Container(
      height: 266,
      decoration: BoxDecoration(
        color: DotColor.dotGray,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "HI!",
            style: TextStyle(
              fontSize: 223,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "배너 위젯\n큰 이미지나 영상으로\n사람들의 이목을 끌 수 있습니다 !",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
