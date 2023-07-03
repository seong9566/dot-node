import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({required this.msg, Key? key}) : super(key: key);

  final String msg;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      title: Text("${msg}"),
      actions: [
        TextButton(
            onPressed: () {
              Get.back();
            },
            child: Text("확인"))
      ],
    );
  }
}
