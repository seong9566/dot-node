import 'package:dot_node/constant.dart';
import 'package:dot_node/controller/user_controller.dart';
import 'package:dot_node/google/google_sign_provider.dart';
import 'package:dot_node/web_view/pages/auth/web_sign_up_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dot_node/core/util/validator.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

/*
 * Project Name:  [DOTnode]
 * Created Date: 2023-05-19
 * Last Modified: 2023-12-03
 * Author: Hyeonseong
 * Modified By: Hyeonseong
 * copyright @ 2023 TeamDOT
 * 
 * --- ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---
 *              Description
 * DB와 통신 후 로그인 성공
 * 
 * 개발시에는 password 유효성 검증 하지 않음.
 * --- ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---
 */

class WebLoginPage extends ConsumerStatefulWidget {
  const WebLoginPage({super.key});

  @override
  _WebLoginPageState createState() => _WebLoginPageState();
}

class _WebLoginPageState extends ConsumerState<WebLoginPage> {
  final _id = TextEditingController();
  final _password = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   loginForm();
    // });
  }

  // void loginForm() {
  //   showDialog(
  //     context: context,
  //     barrierDismissible: false,
  //     builder: (BuildContext context) {
  //       return LoginFormDialog();
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    final uControl = ref.read(userController);
    final googleProvider = ref.read(googleSignProvider);
    //자동 로그인
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/rocket.gif'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Container(
              padding: EdgeInsets.all(10),
              width: 520.w,
              height: 460.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _textFormField(uControl, googleProvider),
                  SizedBox(height: dSizedBoxh),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _loginBtn(
                        text: "Login",
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            uControl.login(
                              userEmail: _id.text.trim(),
                              userPassword: _password.text.trim(),
                            );
                          }
                        },
                        boxDecoration: BoxDecoration(
                          color: mainColor,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(24),
                            bottomRight: Radius.circular(24),
                          ),
                        ),
                      ),
                      SizedBox(width: 4),
                      _dot(),
                      SizedBox(width: 4),
                      _dot(),
                      SizedBox(width: 4),
                      _loginBtn(
                        text: "회원가입",
                        onTap: () {
                          Get.offAll(const WebSignUpPage());
                        },
                        boxDecoration: BoxDecoration(
                          color: mainColor,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(24),
                            bottomLeft: Radius.circular(24),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: dSizedBoxh),
                  _googleLoginBtn(googleProvider),
                  SizedBox(height: dSizedBoxh),
                  _forgotBtn(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _forgotBtn() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "for got ",
          style: TextStyle(fontSize: 12, color: Colors.black),
        ),
        GestureDetector(
          onTap: () {},
          child: Text(
            "ID",
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 8.h,
          child: VerticalDivider(color: Colors.black, thickness: 1),
        ),
        GestureDetector(
          onTap: () {},
          child: Text(
            "PW",
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  Widget _googleLoginBtn(GoogleSignProvider googleProvider) {
    return ElevatedButton.icon(
      onPressed: () {
        googleProvider.googleLogin();
      },
      icon: FaIcon(FontAwesomeIcons.google),
      label: Text("Google login"),
    );
  }

  Widget _textFormField(UserController uControl, GoogleSignProvider googleProvider) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 96),
            child: Column(children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'id'.tr,
                  hintText: 'hint_id'.tr,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    borderSide: BorderSide(color: mainColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    borderSide: BorderSide(color: mainColor),
                  ),
                ),
                //validator: validateId, TODO: 생성 필요
                controller: _id,
              ),
              SizedBox(height: dSizedBoxh),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'password'.tr,
                  hintText: 'hint_password'.tr,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    borderSide: BorderSide(color: mainColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    borderSide: BorderSide(color: mainColor),
                  ),
                ),
                //validator: validatePassword, // 테스트 시에는 사용 안함
                controller: _password,
              ),
            ]),
          ),
        ],
      ),
    );
  }

  Widget _dot() {
    return Container(
      width: 8.w,
      height: 8.h,
      decoration: BoxDecoration(
        color: greyColor,
        borderRadius: BorderRadius.circular(24),
      ),
    );
  }

  Widget _loginBtn({required String text, required VoidCallback onTap, required BoxDecoration boxDecoration}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 167.w,
        height: 40.h,
        decoration: boxDecoration,
        child: Align(
          alignment: Alignment.center,
          child: Text(
            text,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

// class LoginFormDialog extends ConsumerWidget {
//   LoginFormDialog({super.key});

//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

//   // 크기
//   static double dSizedBoxh = 28.h;
//   static double dSizedBoxw = 20.w;
//   static double dWidth = 1024.w;
//   static double dPadding = 30;

// // controller
//   final _email = TextEditingController();
//   final _password = TextEditingController();

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final uControl = ref.read(userController);
//     final googleProvider = ref.read(googleSignProvider);
//     return ScreenUtilInit(
//       designSize: const Size(1920, 1080),
//       builder: (context, child) => Dialog(
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(20.0),
//         ),
//         child: SizedBox(
//           width: dWidth,
//           child: Form(
//             key: _formKey,
//             child: Padding(
//               padding: EdgeInsets.all(dPadding),
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   TextFormField(
//                     decoration: InputDecoration(
//                       labelText: 'email'.tr,
//                       hintText: 'hint_email'.tr,
//                     ),
//                     validator: validateEmail,
//                     controller: _email,
//                   ),
//                   SizedBox(height: dSizedBoxh),
//                   TextFormField(
//                     obscureText: true,
//                     decoration: InputDecoration(
//                       labelText: 'password'.tr,
//                       hintText: 'hint_password'.tr,
//                     ),
//                     //validator: validatePassword, // 테스트 시에는 사용 안함
//                     controller: _password,
//                   ),
//                   SizedBox(height: dSizedBoxh),
//                   Row(
//                     children: [
//                       Expanded(
//                           child: ElevatedButton(
//                               onPressed: () {
//                                 if (_formKey.currentState!.validate()) {
//                                   uControl.login(
//                                     userEmail: _email.text.trim(),
//                                     userPassword: _password.text.trim(),
//                                   );
//                                 }
//                               },
//                               child: Text("login".tr))),
//                       SizedBox(width: dSizedBoxw),
//                       Expanded(
//                           child: ElevatedButton(
//                               onPressed: () {
//                                 Get.offAll(const WebSignUpPage());
//                               },
//                               child: Text("sign".tr))),
//                     ],
//                   ),
//                   SizedBox(height: dSizedBoxh),
//                   ElevatedButton.icon(
//                     onPressed: () {
//                       googleProvider.googleLogin();
//                     },
//                     icon: FaIcon(FontAwesomeIcons.google),
//                     label: Text("Google login"),
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
