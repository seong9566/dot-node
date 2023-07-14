import 'package:dot_node/controller/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

class VerificationModal extends ConsumerWidget {
  VerificationModal({required this.uid, required this.from, key}) : super(key: key);
  String uid;
  String from;
  final _verificationNumber = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final uControl = ref.read(userController);
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      title: Text("휴대폰 인증"),
      actions: [
        TextField(
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'verificationNumber'.tr,
              hintText: 'hint_verificationNumber'.tr,
            ),
            controller: _verificationNumber),
        TextButton(
            onPressed: () {
              uControl.smsVerCheck(uid: uid, from: from, key: _verificationNumber.text.trim());
            },
            child: Text("확인"))
      ],
    );
  }
}
