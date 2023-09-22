import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../personal_page.dart';

class PersonalAppBar extends StatelessWidget implements PreferredSizeWidget {
  const PersonalAppBar({Key? key}) : super(key: key);
  @override
  Size get preferredSize => Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0).w,
      child: SizedBox(
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 70.w,
              height: 70.h,
              child: InkWell(
                child: Image.asset(
                  "assets/metalogo.png",
                  fit: BoxFit.contain,
                ),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'MAIN',
                style: appBarText,
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'PROFILE',
                style: appBarText,
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'WORKS',
                style: appBarText,
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'CONTACT',
                style: appBarText,
              ),
            ),
            SizedBox(width: 1200.w),
            Stack(
              alignment: Alignment.centerRight,
              children: [
                Positioned(
                  child: Transform.scale(
                    scale: 1.0,
                    child: Transform.translate(
                      offset: Offset(0, 0),
                      child: Icon(
                        Icons.apple_rounded,
                        size: 50,
                        color: Color.fromRGBO(110, 110, 110, 110),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  child: Text(
                    "INDUSTRIAL DESIGNER",
                    style: textStyle,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
