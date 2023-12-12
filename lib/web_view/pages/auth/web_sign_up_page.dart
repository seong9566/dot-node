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

class WebSignUpPage extends StatefulWidget {
  const WebSignUpPage({super.key});

  @override
  _WebSignUpPageState createState() => _WebSignUpPageState();
}

class _WebSignUpPageState extends State<WebSignUpPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      signUpForm();
    });
  }

  void signUpForm() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const SignUpFormDialog();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1920, 1080),
      builder: ((context, child) => Scaffold(
            body: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/rocket.gif'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          )),
    );
  }
}

class SignUpFormDialog extends ConsumerStatefulWidget {
  const SignUpFormDialog({super.key});

  @override
  _SignUpFormDialogState createState() => _SignUpFormDialogState();
}

class _SignUpFormDialogState extends ConsumerState<SignUpFormDialog> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  //변수
  late Timer _debounceTimer;

  // size 변수화
  static double dSizedBoxh = 28.h;
  static double dWidth = 1024.w;
  static double dPadding = 30;

// controller
  final userUid = TextEditingController();
  final userEmail = TextEditingController();
  final userPassword = TextEditingController();
  final userTel = TextEditingController();
  final _password_check = TextEditingController();

  @override
  void initState() {
    super.initState();
    _debounceTimer = Timer(const Duration(seconds: 3), () {});
  }

  @override
  void dispose() {
    _debounceTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final uControl = ref.read(userController);
    return ScreenUtilInit(
      designSize: const Size(1920, 1080),
      builder: (context, child) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: SizedBox(
          width: dWidth,
          child: Form(
            key: _formKey,
            child: Padding(
              padding: EdgeInsets.all(dPadding),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Stack(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'userUid'.tr,
                          hintText: 'hint_userUid'.tr,
                        ),
                        //validator: validateUsername,
                        controller: userUid,
                      ),
                      Positioned(
                        bottom: 5,
                        right: 5,
                        child: TextButton(
                          onPressed: () {
                            uControl.userUidCheck(userUid: userUid.text.trim());
                          },
                          child: Text(
                            '중복 확인',
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: dSizedBoxh),
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
                            uControl.emailVerification(uid: userEmail.text.trim(), to: userEmail.text.trim());
                          },
                          child: Text(
                            'verify'.tr,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: dSizedBoxh),
                  Stack(
                    children: [
                      TextFormField(
                        // 서버에 전달 값이 "-"가 빠져있으므로 현재 사용 x, 추후 포맷팅 필요시 사용하기
                        // inputFormatters: [
                        //   FilteringTextInputFormatter.digitsOnly, // 숫자만 사용
                        //   PhoneNumberFormatter(),
                        //   LengthLimitingTextInputFormatter(13)
                        // ],
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
                  SizedBox(height: dSizedBoxh),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'password'.tr,
                      hintText: 'hint_password'.tr,
                    ),
                    controller: userPassword,
                  ),
                  SizedBox(height: dSizedBoxh),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'password_check'.tr,
                      hintText: 'hint_password_check'.tr,
                    ),
                    controller: _password_check,
                  ),
                  SizedBox(height: dSizedBoxh),
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
        ),
      ),
    );
  }
}
