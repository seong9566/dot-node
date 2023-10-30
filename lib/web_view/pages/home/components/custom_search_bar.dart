import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constant.dart';

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
    return SizedBox(
      width: 700.w,
      height: 68.h,
      child: TextFormField(
        decoration: InputDecoration(
          prefixIcon: Padding(
            padding: EdgeInsets.only(left: 24.w),
            child: SizedBox(
              width: 64.w,
              child: DropdownButtonHideUnderline(
                child: DropdownButton2<Icon>(
                  isExpanded: true,
                  items: btnItems
                      .map((Icon item) => DropdownMenuItem<Icon>(
                            value: item,
                            child: item,
                          ))
                      .toList(),
                  value: selectedValue,
                  onChanged: (Icon? value) {
                    setState(() {
                      selectedValue = value;
                    });
                  },
                  buttonStyleData: ButtonStyleData(
                    width: 88.w,
                  ),
                  menuItemStyleData: MenuItemStyleData(
                    padding: EdgeInsets.symmetric(horizontal: 18.w),
                    height: 50.h,
                  ),
                  dropdownStyleData: DropdownStyleData(
                    offset: Offset(-10, 0),
                    width: 68.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
            ),
          ),
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
