import 'package:dot_node/controller/user_controller.dart';
import 'package:dot_node/core/ui/color_asset.dart';
import 'package:dot_node/core/ui/img_res.dart';
import 'package:dot_node/web_view/pages/login/web_login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WebLoginView extends ConsumerStatefulWidget {
  const WebLoginView({super.key});

  @override
  _WebLoginViewState createState() => _WebLoginViewState();
}

class _WebLoginViewState extends ConsumerState<WebLoginView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final vm = ref.read(webLoginViewModel);
    return Scaffold(
      body: Stack(
        children: [
          backgroundImg(),
          Center(
            child: IntrinsicHeight(
              child: Container(
                width: 520.w,
                decoration: BoxDecoration(
                  color: DotColor.dotWhite.withOpacity(0.9),
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: Column(
                  children: [
                    textFormField(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            if (formKey.currentState!.validate()) {
                              vm.login(
                                userEmail: emailController.text.trim(),
                                userPassword: passwordController.text.trim(),
                              );
                            }
                          },
                          child: Container(
                            width: 167.w,
                            decoration: BoxDecoration(
                              color: DotColor.dotPrimary,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(24),
                                bottomRight: Radius.circular(24),
                              ),
                            ),
                            child: Text(
                              "Login",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: DotColor.dotWhite,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: 167.w,
                            decoration: BoxDecoration(
                              color: DotColor.dotPrimary,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(24),
                                bottomLeft: Radius.circular(24),
                              ),
                            ),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                "회원가입",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget backgroundImg() {
    return Center(
      child: Image.asset(
        ImgRes.backgroundImgPath,
        fit: BoxFit.fill,
      ),
    );
  }

  Widget textFormField() {
    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(children: [
            TextFormField(
              decoration: InputDecoration(
                labelText: 'id',
                hintText: 'hint_id',
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  borderSide: BorderSide(color: DotColor.dotPrimary),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  borderSide: BorderSide(color: DotColor.dotPrimary),
                ),
              ),
              //validator: validateId, TODO: 생성 필요
              controller: emailController,
            ),
            SizedBox(height: 10),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'password',
                hintText: 'hint_password',
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  borderSide: BorderSide(color: DotColor.dotPrimary),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  borderSide: BorderSide(color: DotColor.dotPrimary),
                ),
              ),
              //validator: validatePassword, // 테스트 시에는 사용 안함
              controller: passwordController,
            ),
          ]),
        ],
      ),
    );
  }
}

//
// class WebLoginPage extends ConsumerStatefulWidget {
//   const WebLoginPage({super.key});
//
//   @override
//   _WebLoginPageState createState() => _WebLoginPageState();
// }
//
// class _WebLoginPageState extends ConsumerState<WebLoginPage> {
//   final userEmail = TextEditingController();
//   final userPassword = TextEditingController();
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final uControl = ref.read(userController);
//     final googleProvider = ref.read(googleSignProvider);
//     //자동 로그인
//     return Scaffold(
//       body: Stack(
//         children: [
//           backGroundImg(),
//           inputFormField(uControl, googleProvider),
//         ],
//       ),
//     );
//   }
//
//   Widget inputFormField(
//       UserController uControl, GoogleSignProvider googleProvider) {
//     return Center(
//       child: Container(
//         padding: EdgeInsets.all(10),
//         width: 520.w,
//         height: 460.h,
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(12),
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             _textFormField(uControl, googleProvider),
//             SizedBox(height: dSizedBoxh),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 _loginBtn(
//                   text: "Login",
//                   onTap: () {
//                     if (_formKey.currentState!.validate()) {
//                       uControl.login(
//                         userEmail: userEmail.text.trim(),
//                         userPassword: userPassword.text.trim(),
//                       );
//                     }
//                   },
//                   boxDecoration: BoxDecoration(
//                     color: mainColor,
//                     borderRadius: BorderRadius.only(
//                       topRight: Radius.circular(24),
//                       bottomRight: Radius.circular(24),
//                     ),
//                   ),
//                 ),
//                 SizedBox(width: 4),
//                 _dot(),
//                 SizedBox(width: 4),
//                 _dot(),
//                 SizedBox(width: 4),
//                 _loginBtn(
//                   text: "회원가입",
//                   onTap: () {
//                     Get.offAll(const WebSignUpPage());
//                   },
//                   boxDecoration: BoxDecoration(
//                     color: mainColor,
//                     borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(24),
//                       bottomLeft: Radius.circular(24),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: dSizedBoxh),
//             _googleLoginBtn(googleProvider),
//             SizedBox(height: dSizedBoxh),
//             _forgotBtn(),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget backGroundImg() {
//     return Container(
//       decoration: const BoxDecoration(
//         image: DecorationImage(
//           image: AssetImage('assets/rocket.gif'),
//           fit: BoxFit.cover,
//         ),
//       ),
//     );
//   }
//
//   Widget _forgotBtn() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Text(
//           "for got ",
//           style: TextStyle(fontSize: 12, color: Colors.black),
//         ),
//         GestureDetector(
//           onTap: () {},
//           child: Text(
//             "ID",
//             style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
//           ),
//         ),
//         SizedBox(
//           height: 8.h,
//           child: VerticalDivider(color: Colors.black, thickness: 1),
//         ),
//         GestureDetector(
//           onTap: () {},
//           child: Text(
//             "PW",
//             style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _googleLoginBtn(GoogleSignProvider googleProvider) {
//     return ElevatedButton.icon(
//       onPressed: () {
//         googleProvider.googleLogin();
//       },
//       icon: FaIcon(FontAwesomeIcons.google),
//       label: Text("Google login"),
//     );
//   }
//
//
//   Widget _dot() {
//     return Container(
//       width: 8.w,
//       height: 8.h,
//       decoration: BoxDecoration(
//         color: greyColor,
//         borderRadius: BorderRadius.circular(24),
//       ),
//     );
//   }
//
//   Widget _loginBtn(
//       {required String text,
//       required VoidCallback onTap,
//       required BoxDecoration boxDecoration}) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         width: 167.w,
//         height: 40.h,
//         decoration: boxDecoration,
//         child: Align(
//           alignment: Alignment.center,
//           child: Text(
//             text,
//             style: TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.bold,
//               color: Colors.white,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
