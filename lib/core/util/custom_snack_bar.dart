import 'package:flutter/material.dart';

class CustomSnackBar extends SnackBar {
  CustomSnackBar({
    super.key,
    required String msg,
    Color backgroundColor = Colors.white,
    Duration duration = const Duration(seconds: 3),
    SnackBarBehavior behavior = SnackBarBehavior.floating,
  }) : super(
          content: Text(msg, style: TextStyle(color: Colors.black)),
          duration: duration,
          backgroundColor: backgroundColor,
          behavior: behavior,
        );
}
