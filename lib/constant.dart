import 'package:dot_node/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final dContext = navigatorKey.currentContext;
const FontWeight fWeight = FontWeight.bold;
double fTitleSize = 24.sp;
double fContentSize = 16.sp;
double fHeight = 400.h;
double fWidth = 600.w;
double totalBannerWidth = 920.w;
double totalBannerHeight = 360.h;
double mdWidth = MediaQuery.of(dContext!).size.width;
double mdHidth = MediaQuery.of(dContext!).size.height;

const Color searchBarColor = Color(0xffAA80CC);
final firstBackGroundColor = Colors.grey.shade800;
final secondBackGroundColor = Colors.grey.shade900;
