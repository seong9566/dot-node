import 'package:dot_node/util/ui/color_asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WidgetItems extends StatefulWidget {
  const WidgetItems({super.key});

  @override
  State<WidgetItems> createState() => _WidgetItemsState();
}

class _WidgetItemsState extends State<WidgetItems>
    with SingleTickerProviderStateMixin {
  List<Widget> listItem = [
    Container(
      width: 280.w,
      color: Colors.amber,
    ),
    Container(
      width: 280.w,
      color: Colors.red,
    ),
    Container(
      width: 280.w,
      color: Colors.green,
    ),
    Container(
      width: 280.w,
      color: Colors.blue,
    ),
    Container(
      width: 280.w,
      color: Colors.orange,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        categoryBtn(context),
        GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // 가로에 표시할 아이템 수
            crossAxisSpacing: 8.0, // 가로 간격
            mainAxisSpacing: 8.0, // 세로 간격
          ),
          itemCount: listItem.length,
          itemBuilder: (context, index) {
            return listItem[index];
          },
        ),
      ],
    );
  }

  Widget categoryBtn(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox.shrink(),
        Container(
          padding: EdgeInsets.symmetric(vertical: 24),
          width: MediaQuery.sizeOf(context).width * 0.2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Banner",
                style: TextStyle(
                  color: DotColor.dotPrimary,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Layout",
                style: TextStyle(
                  color: DotColor.dotBlack,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "List",
                style: TextStyle(
                  color: DotColor.dotBlack,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        SizedBox.shrink(),
      ],
    );
  }
}
