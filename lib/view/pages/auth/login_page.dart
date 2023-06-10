import 'package:dot_node/controller/user_controller.dart';
import 'package:dot_node/view/pages/auth/sign_up_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:get/get.dart';

/*
 * Project Name:  [DOTnode]
 * Created Date: 2023-05-03 15:29:10
 * Last Modified: 2023-05-04 23:17:12
 * Author: Hyeonseong
 * Modified By: Hyeonseong
 * copyright @ 2023 TeamDOT
 * --- ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---
 *              Description
 * 로그인 페이지
 * 05-26 웹으로 헤더
 * --- ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---
 */

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});
  static const double dHeight = 28;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

// controller
  final _email = TextEditingController();
  final _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final uControl = ref.read(userController);
    return Scaffold(
      appBar: AppBar(
        title: const Text("DOTnode Login"),
      ),
      body: Stack(
        children: [
          const Positioned.fill(
            child: Image(
              image: AssetImage('assets/rocket.gif'),
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 2 - 200,
            left: MediaQuery.of(context).size.width / 2 - 200,
            child: Container(
              width: 400,
              decoration: BoxDecoration(color: Colors.white.withOpacity(0.9), borderRadius: BorderRadius.circular(10.0)),
              child: LoginForm(context, uControl),
            ),
          ),
        ],
      ),
    );
  }

  Widget LoginForm(BuildContext context, UserController uControl) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            const Text(
              "Wellcome!",
              style: TextStyle(fontSize: 30),
            ),
            const SizedBox(height: LoginPage.dHeight),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'email'.tr,
                hintText: 'hint_email'.tr,
              ),
              onSaved: (val) {},
              validator: (val) {
                return null;
              },
              controller: _email,
            ),
            const SizedBox(height: LoginPage.dHeight),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'password'.tr,
                hintText: 'hint_password'.tr,
              ),
              onSaved: (val) {},
              validator: (val) {
                return null;
              },
              controller: _password,
            ),
            const SizedBox(height: LoginPage.dHeight),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  uControl.login(
                    userEmail: _email.text.trim(),
                    userPassword: _password.text.trim(),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(MediaQuery.of(context).size.width, 50),
              ),
              child: Text("login".tr),
            ),
            const SizedBox(height: LoginPage.dHeight),
            Row(
              children: [
                Expanded(child: ElevatedButton(onPressed: () {}, child: const Text("구글"))),
                const SizedBox(width: 20),
                Expanded(child: ElevatedButton(onPressed: () {}, child: const Text("카카오"))),
              ],
            ),
            TextButton(
              onPressed: () {
                Get.offAll(const SignUpPage());
              },
              child: Text("sign".tr),
            ),
          ],
        ),
      ),
    );
  }
}
