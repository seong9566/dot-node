import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/*
 * Project Name:  [DOTnode]
 * Created Date: 2023-06-17 
 * Last Modified: 2023-07-01
 * Author: Hyeonseong
 * Modified By: Hyeonseong
 * copyright @ 2023 TeamDOT
 * --- ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---
 *              Description
 * Personal의 Main 페이지 
 * --- ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---
 */
final firstBackGroundColor = Colors.grey.shade800;
final secondBackGroundColor = Colors.grey.shade900;
final textStyle = TextStyle(fontSize: 12.sp, color: Colors.white);
final appBarText = TextStyle(fontSize: 12.sp, color: Colors.white38);

class PersonalPage extends StatefulWidget {
  const PersonalPage({super.key});

  @override
  State<PersonalPage> createState() => _PersonalPageState();
}

class _PersonalPageState extends State<PersonalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: firstBackGroundColor,
      body: Padding(
        padding: EdgeInsets.all(40.0).w,
        child: Container(
          decoration: BoxDecoration(color: secondBackGroundColor),
          child: Column(
            children: [
              PersonalAppBar(),
            ],
          ),
        ),
      ),
    );
  }
}

class PersonalAppBar extends StatelessWidget {
  const PersonalAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0).w,
      child: Container(
        width: double.infinity,
        // color: Colors.amber,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              //decoration: BoxDecoration(color: Colors.white),
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
