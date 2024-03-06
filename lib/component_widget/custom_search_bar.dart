import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constant.dart';

class CustomSearchBar extends StatefulWidget {
  CustomSearchBar({super.key});

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
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
      margin: EdgeInsets.only(top: 20),
      width: 700.w,
      height: 68.h,
      child: TextFormField(
        decoration: InputDecoration(
          suffixIcon: Padding(
            padding: EdgeInsets.only(right: 24.w),
            child: Icon(
              Icons.search_sharp,
              color: Colors.grey.shade500,
              size: 36.sp,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(32)),
            borderSide: BorderSide(color: searchBarColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(32)),
            borderSide: BorderSide(color: searchBarColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(32)),
            borderSide: BorderSide(color: searchBarColor),
          ),
        ),
      ),
    );
  }
}
