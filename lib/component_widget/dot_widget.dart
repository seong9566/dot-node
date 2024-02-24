import 'package:dot_node/util/ui/color_asset.dart';
import 'package:dot_node/util/ui/img_res.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget simpleButton(
    BuildContext context, VoidCallback callBack, String name, bool isActive) {
  return SizedBox(
    width: 160.w,
    height: 60.h,
    child: ElevatedButton(
      onPressed: () {
        FocusScope.of(context).unfocus();
        callBack.call();
      },
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(40),
            bottomRight: Radius.circular(40),
          ),
        ),
        backgroundColor: isActive ? DotColor.dotPrimary : DotColor.dotGray,
      ),
      child: Text(
        name,
        style: const TextStyle(
            fontSize: 20, color: Colors.white, fontWeight: FontWeight.w700),
      ),
    ),
  );
}

Widget backgroundImg() {
  return Positioned.fill(
    child: Image.asset(
      ImgRes.backgroundImgPath,
      fit: BoxFit.fill,
    ),
  );
}

List<Container> bottomDot() {
  return [
    Container(
      margin: EdgeInsets.symmetric(horizontal: 2),
      width: 5.w,
      height: 5.h,
      decoration: BoxDecoration(
        color: DotColor.dotGray,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
    ),
    Container(
      margin: EdgeInsets.symmetric(horizontal: 2),
      width: 5.w,
      height: 5.h,
      decoration: BoxDecoration(
        color: DotColor.dotGray,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
    ),
  ];
}
