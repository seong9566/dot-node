import 'dart:async';

import 'package:dot_node/controller/user_controller.dart';
import 'package:dot_node/web_view/pages/auth/model/sign_up_model.dart';
import 'package:dot_node/web_view/pages/auth/model/sign_up_view_model.dart';
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
  late dynamic _isUsernameValid = 'true';
  late bool _isCheckUsername = false;

  // size 변수화
  static double dSizedBoxh = 28.h;
  static double dSizedBoxw = 20.w;
  static double dWidth = 1024.w;
  static double dPadding = 30;

// controller
  final _username = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _password_check = TextEditingController();
  final _phoneNumber = TextEditingController();

  void validateUsername(String userName, SignUpModel model) {
    if (_debounceTimer.isActive) {
      _debounceTimer.cancel();
    }
    _debounceTimer = Timer(const Duration(seconds: 1), () async {
      _checkUsernameAvailability(userName, model);
      setState(() {
        _isCheckUsername = true;
      });
    });
  }

  Future<void> _checkUsernameAvailability(String userName, SignUpModel model) async {
    if (userName.isNotEmpty) {
      setState(() {
        _isCheckUsername = true;
      });

      await Future.delayed(const Duration(seconds: 1));
      Logger().d("데이터 확인 : ${model.result}");
      setState(() {
        _isUsernameValid = model.result;
        _isCheckUsername = false;
      });
    }
  }

  @override
  void dispose() {
    _debounceTimer.cancel();
    _username.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _debounceTimer = Timer(const Duration(seconds: 3), () {});
  }

  @override
  Widget build(BuildContext context) {
    final uControl = ref.read(userController);
    final model = ref.read(signUpViewModel);
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
                          labelText: 'name'.tr,
                          hintText: 'hint_name'.tr,
                        ),
                        //validator: validateUsername,
                        controller: _username,
                        onFieldSubmitted: ((value) {
                          ref.read(signUpViewModel.notifier).notifyViewModel(value);
                          validateUsername(value, model!);
                        }),
                      ),
                      Positioned(
                        bottom: 5,
                        right: 20,
                        child: Icon(
                          Icons.check_circle,
                          color: _isCheckUsername ? (_isUsernameValid == true ? Colors.green : Colors.red) : Colors.grey,
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
                        controller: _email,
                      ),
                      Positioned(
                        bottom: 5,
                        right: 5,
                        child: TextButton(
                          onPressed: () {
                            uControl.emailVerification(uid: _username.text.trim(), to: _email.text.trim());
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
                        controller: _phoneNumber,
                      ),
                      Positioned(
                        bottom: 5,
                        right: 5,
                        child: TextButton(
                          onPressed: () {
                            uControl.smsVerification(uid: _username.text.trim(), to: _phoneNumber.text.trim());
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
                    controller: _password,
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
                            userUid: _username.text.trim(),
                            userEmail: _email.text.trim(),
                            userPassword: _password.text.trim(),
                            userTel: _phoneNumber.text.trim(),
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
