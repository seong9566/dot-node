import 'package:dot_node/core/ui/color_asset.dart';
import 'package:dot_node/web_view/pages/auth/sign_in_view_model.dart';
import 'package:dot_node/widget/dot_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

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

class SignInView extends ConsumerStatefulWidget {
  const SignInView({super.key});

  @override
  _WebSignUpPageState createState() => _WebSignUpPageState();
}

class _WebSignUpPageState extends ConsumerState<SignInView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

// controller
  final userUid = TextEditingController();
  final userEmail = TextEditingController();
  final userPassword = TextEditingController();
  final userPasswordConfirm = TextEditingController();
  final userTel = TextEditingController();

  bool isEmailField = false;
  bool isPhoneField = false;
  bool isPasswordField = false;
  bool isPasswordCheck = false;
  final String firstText = "회원가입을 위해, 사용하실 ID를 먼저 입력해 주세요";
  final String secondText = "안전한 계정관리를 위해 E-mail인증을 해주세요";

  @override
  Widget build(BuildContext context) {
    final vm = ref.read(signInViewModel);
    return Scaffold(
      body: Stack(
        children: [
          backgroundImg(),
          Center(
            child: IntrinsicHeight(
              child: Container(
                width: MediaQuery.sizeOf(context).width,
                padding:
                    EdgeInsets.symmetric(horizontal: 160.r, vertical: 60.r),
                margin: EdgeInsets.symmetric(horizontal: 280.r),
                decoration: BoxDecoration(
                  color: DotColor.dotWhite,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20.r),
                  ),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 15.r,
                    )
                  ],
                ),
                child: Center(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        inputFieldAndBtn(
                          "hint_id".tr,
                          "Check",
                          () {
                            vm.idCheck(userUid: userUid.text.trim());
                          },
                          userUid,
                        ),
                        SizedBox(height: 30.h),
                        inputFieldAndBtn(
                          "hint_email".tr,
                          "Verify",
                          () {
                            vm.emailCheck(
                                userUid: userUid.text.trim(),
                                userEmail: userEmail.text.trim());
                          },
                          userEmail,
                        ),
                        SizedBox(height: 30.h),
                        inputFieldAndBtn("hint_phoneNumber".tr, "Verify", () {
                          vm.telCheck(
                            userUid: userUid.text.trim(),
                            userTel: userTel.text.trim(),
                          );
                        }, userTel),
                        SizedBox(height: 30.h),
                        inputField("hint_password".tr),
                        SizedBox(height: 30.h),
                        inputField("hint_password_check".tr),
                        SizedBox(height: 40.h),
                        simpleButton(context, () {}, "JOIN", true),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          // inputField(uControl),
        ],
      ),
    );
  }

  Widget inputFieldAndBtn(String hintText, String btnText,
      VoidCallback onPressed, TextEditingController controller) {
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hintText,
          ),
        ),
        Container(
          width: 65.w,
          padding: EdgeInsets.symmetric(vertical: 4),
          decoration: BoxDecoration(
            color: DotColor.dotGray,
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          child: TextButton(
            onPressed: onPressed,
            child: Text(
              btnText,
              style: TextStyle(
                  color: DotColor.dotBlack,
                  fontSize: 16,
                  fontWeight: FontWeight.w700),
            ),
          ),
        ),
      ],
    );
  }

  Widget inputField(String hintText) {
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        TextFormField(
          decoration: InputDecoration(
            hintText: hintText,
          ),
        ),
      ],
    );
  }

  // Widget inputField(UserController uControl) {
  //   return Center(
  //       child: IntrinsicHeight(
  //     child: Container(
  //       width: 700,
  //       height: 700,
  //       padding: EdgeInsets.symmetric(horizontal: 60, vertical: 78),
  //       decoration: BoxDecoration(
  //         color: DotColor.dotWhite,
  //         borderRadius: BorderRadius.all(
  //           Radius.circular(20),
  //         ),
  //         boxShadow: <BoxShadow>[
  //           BoxShadow(
  //             color: Colors.grey.shade300,
  //             blurRadius: 15,
  //           )
  //         ],
  //       ),
  //       child: Form(
  //         key: _formKey,
  //         child: Column(
  //           children: [
  //             Row(
  //               children: [
  //                 TextFormField(
  //                   decoration: InputDecoration(
  //                     hintText: 'hint_id'.tr,
  //                   ),
  //                 ),
  //                 ElevatedButton(
  //                   onPressed: () {},
  //                   child: Text("중복 확인"),
  //                 ),
  //               ],
  //             )
  //             // Stack(
  //             //   children: [
  //             //     TextFormField(
  //             //       decoration: InputDecoration(
  //             //         labelText: 'id'.tr,
  //             //         hintText: 'hint_id'.tr,
  //             //       ),
  //             //       //validator: validateUsername,
  //             //       controller: userUid,
  //             //     ),
  //             //     Positioned(
  //             //       bottom: 5,
  //             //       right: 5,
  //             //       child: TextButton(
  //             //         onPressed: () {
  //             //           uControl.userNameCheck(
  //             //               userUid: userUid.text.trim()).then((value) => );
  //             //         },
  //             //         child: Text(
  //             //           '중복 확인',
  //             //         ),
  //             //       ),
  //             //     ),
  //             //   ],
  //             // ),
  //             // SizedBox(height: 28.h),
  //             // Stack(
  //             //   children: [
  //             //     TextFormField(
  //             //       decoration: InputDecoration(
  //             //         labelText: 'email'.tr,
  //             //         hintText: 'hint_email'.tr,
  //             //       ),
  //             //       validator: validateEmail,
  //             //       controller: userEmail,
  //             //     ),
  //             //     Positioned(
  //             //       bottom: 5,
  //             //       right: 5,
  //             //       child: TextButton(
  //             //         onPressed: () {
  //             //           uControl.emailVerification(
  //             //               uid: userUid.text.trim(),
  //             //               to: userEmail.text.trim());
  //             //         },
  //             //         child: Text(
  //             //           'verify'.tr,
  //             //         ),
  //             //       ),
  //             //     ),
  //             //   ],
  //             // ),
  //             // SizedBox(height: 28.h),
  //             // Stack(
  //             //   children: [
  //             //     TextFormField(
  //             //       decoration: InputDecoration(
  //             //         labelText: 'phoneNumber'.tr,
  //             //         hintText: 'hint_phoneNumber'.tr,
  //             //       ),
  //             //       controller: userTel,
  //             //     ),
  //             //     Positioned(
  //             //       bottom: 5,
  //             //       right: 5,
  //             //       child: TextButton(
  //             //         onPressed: () {
  //             //           uControl.smsVerification(
  //             //               uid: userUid.text.trim(),
  //             //               to: userTel.text.trim());
  //             //         },
  //             //         child: Text(
  //             //           'verify'.tr,
  //             //         ),
  //             //       ),
  //             //     ),
  //             //   ],
  //             // ),
  //             // SizedBox(height: 28.h),
  //             // TextFormField(
  //             //   obscureText: true,
  //             //   decoration: InputDecoration(
  //             //     labelText: 'password'.tr,
  //             //     hintText: 'hint_password'.tr,
  //             //   ),
  //             //   controller: userPassword,
  //             // ),
  //             // SizedBox(height: 28.h),
  //             // TextFormField(
  //             //   obscureText: true,
  //             //   decoration: InputDecoration(
  //             //     labelText: 'password_check'.tr,
  //             //     hintText: 'hint_password_check'.tr,
  //             //   ),
  //             //   controller: userPasswordConfirm,
  //             // ),
  //             // SizedBox(height: 28.h),
  //             SizedBox(
  //               width: double.infinity,
  //               height: 40,
  //               child: ElevatedButton(
  //                 onPressed: () {
  //                   if (_formKey.currentState!.validate()) {
  //                     uControl.sign(
  //                       userUid: userUid.text.trim(),
  //                       userEmail: userEmail.text.trim(),
  //                       userPassword: userPassword.text.trim(),
  //                       userTel: userTel.text.trim(),
  //                     );
  //                   }
  //                 },
  //                 child: const Text("Get Started"),
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   ));
  // }
}
