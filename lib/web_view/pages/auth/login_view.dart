import 'package:dot_node/component_widget/dot_widget.dart';
import 'package:dot_node/core/route_page.dart';
import 'package:dot_node/util/ui/color_asset.dart';
import 'package:dot_node/web_view/pages/auth/web_login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginView extends ConsumerStatefulWidget {
  const LoginView({super.key});

  @override
  _WebLoginViewState createState() => _WebLoginViewState();
}

class _WebLoginViewState extends ConsumerState<LoginView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final vm = ref.read(webLoginViewModel);
    return Scaffold(
      body: Stack(
        children: [backgroundImg(), loginModal(vm)],
      ),
    );
  }

  Widget loginModal(WebLoginViewModel vm) {
    return Center(
      child: IntrinsicHeight(
        child: Container(
          width: 800.w,
          margin: EdgeInsets.symmetric(horizontal: 70),
          padding: EdgeInsets.symmetric(horizontal: 90, vertical: 78),
          decoration: BoxDecoration(
            color: DotColor.dotWhite,
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.grey.shade300,
                blurRadius: 15,
              )
            ],
          ),
          child: Column(
            children: [
              textFormField(),
              SizedBox(height: 40),
              loginAndSignButton(vm),
            ],
          ),
        ),
      ),
    );
  }

  Widget loginAndSignButton(WebLoginViewModel vm) {
    final EdgeInsets buttonPadding =
        EdgeInsets.symmetric(horizontal: 18, vertical: 14);
    return Row(
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
            padding: buttonPadding,
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
        ...bottomDot(),
        GestureDetector(
          onTap: () {
            RoutePage.move(context, RoutePage.sign);
          },
          child: Container(
            width: 167.w,
            padding: buttonPadding,
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
                "Sign in",
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
                hintText: 'hint_id'.tr,
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
                hintText: 'hint_password'.tr,
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
