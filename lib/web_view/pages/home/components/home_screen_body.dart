import 'package:dot_node/models/app_bar_model.dart';
import 'package:dot_node/web_view/pages/home/components/home_banner.dart';
import 'package:dot_node/web_view/pages/home/components/custom_search_bar.dart';
import 'package:dot_node/web_view/pages/home/components/custom_marquee.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
  final List<Icon> btnItems = [
    Icon(Icons.recent_actors, size: 30.sp),
    Icon(Icons.account_circle_outlined, size: 30.sp),
    Icon(CupertinoIcons.group_solid, size: 30.sp),
  ];

  Icon? selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = btnItems[0];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          // home/components/custom_app_bar
          CustomMarquee(
            items: [
              MarqueeTest(dotChain: appBarTextList[0].dotChain, str: appBarTextList[0].str),
            ],
          ),
          SizedBox(height: 84.h),
          CustomSearchBar(),
          SizedBox(height: 46.h),
          HomeBanner(),
        ],
      ),
    );
  }
}
