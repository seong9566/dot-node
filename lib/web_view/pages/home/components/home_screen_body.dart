import 'package:dot_node/web_view/pages/home/components/home_banner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'marquee_app_bar.dart';

/*
 * Project Name:  [DOTnode]
 * Created Date: 2023-10-09
 * Last Modified: 2023-10-11
 * Author: Hyeonseong
 * Modified By: Hyeonseong
 * copyright @ 2023 TeamDOT
 * --- ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---
 *              Description
 * HomePage의 Body
 * Body에 들어갈 위젯들이 정의 되어 있음.
 * ScreenUtil : 반응형으로 적용됨.
 * --- ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---
 */

class HomeScreenBody extends StatefulWidget {
  HomeScreenBody({super.key});

  @override
  State<HomeScreenBody> createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          // home/components/custom_app_bar
          MarQueeAppBar(),
          SizedBox(height: 100.h),
          HomeBanner(),
          SizedBox(height: 100.h),
          HomeBanner(),
        ],
      ),
    );
  }
}
