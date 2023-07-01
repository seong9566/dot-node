import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// 커스텀 앱바를 구현하기 위해선 PreferriedSizeWidget를 상속받아야한다.
class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  CustomAppBar({required this.scaffoldKey, super.key});

  final GlobalKey<ScaffoldState> scaffoldKey;
  @override
  State<CustomAppBar> createState() => _CustomAppBar();

  @override
  Size get preferredSize => Size.fromHeight(60);
}

class _CustomAppBar extends State<CustomAppBar> {
  late FocusNode _focusNode;
  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _focusNode.dispose();

    super.dispose();
  }

  final TextStyle fontStyle = TextStyle(color: Colors.grey.shade600, fontSize: 16, fontWeight: FontWeight.w600);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(
                Icons.home,
                color: Colors.black,
              ),
              Row(
                children: [
                  TextButton(
                    onPressed: (() {}),
                    child: Text(
                      "사람",
                      style: fontStyle,
                    ),
                  ),
                  TextButton(
                    onPressed: (() {}),
                    child: Text(
                      "작업",
                      style: fontStyle,
                    ),
                  ),
                  TextButton(
                    onPressed: (() {}),
                    child: Text(
                      "채용",
                      style: fontStyle,
                    ),
                  ),
                  TextButton(
                    onPressed: (() {}),
                    child: Text(
                      "취업",
                      style: fontStyle,
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 600.w,
                height: 60.h,
                child: TextField(
                  focusNode: _focusNode,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey.shade100,
                    hintText: "검색",
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 8.0),
                    prefixIcon: Icon(Icons.search),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      borderSide: BorderSide(
                        color: Colors.grey.shade200,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      borderSide: BorderSide(
                        color: Colors.grey.shade200,
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.email,
                      color: Colors.black,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.notifications,
                      color: Colors.black,
                    ),
                  ),
                  CircleAvatar(
                      // 추후 만약 null이면 null일때 이미지 보여주도록 하기.
                      backgroundImage: AssetImage("assets/profile.jpeg")),
                  Image.asset("assets/testlogo.jpg"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
