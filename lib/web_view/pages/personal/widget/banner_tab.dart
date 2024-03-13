import 'package:dot_node/util/ui/color_asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BannerTab extends StatefulWidget {
  const BannerTab({super.key});

  @override
  State<BannerTab> createState() => _BannerTabState();
}

class _BannerTabState extends State<BannerTab> {
  List<DumyData> dumyList = [
    DumyData("Item1", "Item1", "Item1"),
    DumyData("Item2", "Item2", "Item2"),
    DumyData("Item3", "Item3", "Item3"),
    DumyData("Item4", "Item4", "Item4"),
    DumyData("Item5", "Item5", "Item5"),
    DumyData("Item6", "Item6", "Item6"),
    DumyData("Item7", "Item7", "Item7"),
    DumyData("Item8", "Item8", "Item8"),
    DumyData("Item9", "Item9", "Item9"),
    DumyData("Item10", "Item10", "Item10"),
    DumyData("Item11", "Item11", "Item11"),
    DumyData("Item12", "Ite2m1", "Item12"),
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 1 / 0.9,

        /// 가로 세로 비율
      ),
      itemCount: dumyList.length,
      itemBuilder: (context, index) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 10.h),
          width: 380.w,
          height: 360.h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                color: DotColor.dotGray,
                width: double.infinity,
                height: 320.h,
              ),
              SizedBox(height: 10.h),
              Expanded(
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.topLeft,
                  child: Column(
                    children: [
                      Text("${dumyList[index].title}"),
                      Text("${dumyList[index].body}"),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget testWidget() {
    return Container(
      width: 340,
      height: 340,
      color: Colors.grey,
    );
  }
}

class DumyData {
  final String title;
  final String body;
  final String img;

  DumyData(this.title, this.body, this.img);
}
