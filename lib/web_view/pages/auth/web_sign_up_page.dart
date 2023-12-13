import 'dart:async';

import 'package:dot_node/controller/user_controller.dart';
import 'package:dot_node/web_view/pages/auth/model/sign_up_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dot_node/core/util/validator.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

/*
 * Project Name:  [DOTnode]
 * Created Date: 2023-05-22
 * Last Modified: 2023-05-22
 * Author: Hyeonseong
 * Modified By: Hyeonseong
 * copyright @ 2023 TeamDOT
 * 
 * --- ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---
 *              Description
 * 회원가입 페이지
 * TODO : 유저네임 체크 버튼 마무리 하기 
 * : 1. 아무것도 입력 하지 않았을 경우 = grey
 *   2. 중복되었을 경우 = red
 *   3. 사용가능할 경우 = green
 * Model은 
 * --- ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---
 */

class WebSignUpPage extends ConsumerStatefulWidget {
  const WebSignUpPage({super.key});

  @override
  _WebSignUpPageState createState() => _WebSignUpPageState();
}

class _WebSignUpPageState extends ConsumerState<WebSignUpPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
// controller
  final userUid = TextEditingController();
  final userEmail = TextEditingController();
  final userPassword = TextEditingController();
  final userPasswordConfirm = TextEditingController();
  final userTel = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final uControl = ref.read(userController);
    return Scaffold(
      body: Stack(
        children: [
          backgroundImg(),
          inputField(uControl),
        ],
      ),
    );
  }

  Widget inputField(UserController uControl) {
    return Center(
        child: Container(
      width: 520.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'id'.tr,
                      hintText: 'hint_id'.tr,
                    ),
                    //validator: validateUsername,
                    controller: userUid,
                  ),
                  Positioned(
                    bottom: 5,
                    right: 5,
                    child: TextButton(
                      onPressed: () {
                        uControl.userNameCheck(userUid: userUid.text.trim());
                      },
                      child: Text(
                        '중복 확인',
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 28.h),
              Stack(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'email'.tr,
                      hintText: 'hint_email'.tr,
                    ),
                    validator: validateEmail,
                    controller: userEmail,
                  ),
                  Positioned(
                    bottom: 5,
                    right: 5,
                    child: TextButton(
                      onPressed: () {
                        uControl.emailVerification(uid: userUid.text.trim(), to: userEmail.text.trim());
                      },
                      child: Text(
                        'verify'.tr,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 28.h),
              Stack(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'phoneNumber'.tr,
                      hintText: 'hint_phoneNumber'.tr,
                    ),
                    controller: userTel,
                  ),
                  Positioned(
                    bottom: 5,
                    right: 5,
                    child: TextButton(
                      onPressed: () {
                        uControl.smsVerification(uid: userUid.text.trim(), to: userTel.text.trim());
                      },
                      child: Text(
                        'verify'.tr,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 28.h),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'password'.tr,
                  hintText: 'hint_password'.tr,
                ),
                controller: userPassword,
              ),
              SizedBox(height: 28.h),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'password_check'.tr,
                  hintText: 'hint_password_check'.tr,
                ),
                controller: userPasswordConfirm,
              ),
              SizedBox(height: 28.h),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      uControl.sign(
                        userUid: userUid.text.trim(),
                        userEmail: userEmail.text.trim(),
                        userPassword: userPassword.text.trim(),
                        userTel: userTel.text.trim(),
                      );
                    }
                  },
                  child: const Text("Get Started"),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }

  Widget backgroundImg() {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/rocket.gif'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
