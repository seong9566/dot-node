import 'package:dot_node/controller/user_controller.dart';
import 'package:dot_node/core/util/phone_number_formatter.dart';
import 'package:dot_node/core/util/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

/*
 * Project Name:  [DOTnode]
 * Created Date: 2023-05-19 
 * Last Modified: 2023-05-19 
 * Author: Hyeonseong
 * Modified By: Hyeonseong
 * copyright @ 2023 TeamDOT
 * 
 * --- ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---
 *              Description
 * TODO : 
 * 1. 유효성 검증 시 인증 버튼 움직임 해결하기,
 * 2. 유저 네임 중복 체크 버튼 -> 기획 상 자동으로 API호출 해서 바뀌는 형식인거 같음 그러면.. 계속 DB와 통신 해야하나?
 * - 첫번째 방법 : 유저가 필드를 벗어날 경우 DB와 통신
 * - 두번째 방법 : 일정 시간 이후 DB와 통신
 * 3. 각 버튼의 인증 기능
 * 4. 서버에 role값이 있음 이게 뭐지?
 * 
 * 회원가입 페이지.
 * 현재 UI 진행 사항 : ScreenUtil사용, size는 모두 클래스내부 static변수 처리
 * 앞으로 해야할 사항 : 이메일 인증, 비밀번호 인증 
 * 밸리데이션 체크 시 verify버튼이 아래로 내려가는 현상 
 * --- ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---
 */
class SignUpPage extends ConsumerStatefulWidget {
  const SignUpPage({super.key});

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends ConsumerState<SignUpPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  static double dHeight = 28.h; // screen util을 사용 시 가로,세로 각각 .w, .h 를 넣는다.
  static double dWidth = 340.w;
  static double dTitleText = 30.sp;
  static double dSubText = 14.sp;

// controller
  final _username = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _password_check = TextEditingController();
  final _phoneNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final uControl = ref.read(userController);
    return ScreenUtilInit(
      designSize: const Size(360, 690), // 기준이 되는 디바이스 크기
      builder: ((context, child) => Scaffold(
            appBar: AppBar(
              title: const Text("DOTnode SignUp"),
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
                  top: MediaQuery.of(context).size.height / 2 - 400,
                  left: MediaQuery.of(context).size.width / 2 - 200,
                  child: Container(
                    width: dWidth,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.9),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: SignUpForm(context, dTitleText, dSubText, uControl),
                  ),
                ),
              ],
            ),
          )),
    );
  }

  // ignore: non_constant_identifier_names
  Widget SignUpForm(BuildContext context, double dTitle, double dSubText,
      UserController uControl) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            Text(
              "WellCome!",
              style: TextStyle(fontSize: dTitle),
            ),
            SizedBox(height: dHeight),
            TextFormField(
              validator: validateUsername,
              decoration: InputDecoration(
                labelText: 'name'.tr,
                hintText: 'hint_name'.tr,
              ),
              controller: _username,
            ),
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
                  right: 10,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'verify'.tr,
                      style: TextStyle(fontSize: dSubText),
                    ),
                  ),
                ),
              ],
            ),
            Stack(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'phoneNumber'.tr,
                    hintText: 'hint_phoneNumber'.tr,
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly, // 숫자만 사용
                    PhoneNumberFormatter(),
                    LengthLimitingTextInputFormatter(13) //숫자 포함 하이픈은 13자리
                  ],
                  controller: _phoneNumber,
                ),
                Positioned(
                  bottom: 5,
                  right: 10,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'verify'.tr,
                      style: TextStyle(fontSize: dSubText),
                    ),
                  ),
                ),
              ],
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'password'.tr,
                hintText: 'hint_password'.tr,
              ),
              validator: validatePassword,
              controller: _password,
            ),
            Stack(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'password_check'.tr,
                    hintText: 'hint_password_check'.tr,
                  ),
                  validator: validatePassword,
                  controller: _password_check,
                ),
                Positioned(
                  bottom: 5,
                  right: 10,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'verify'.tr,
                      style: TextStyle(fontSize: dSubText),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: dHeight),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  uControl.sign(
                    username: _username.text.trim(),
                    userEmail: _email.text.trim(),
                    userPassword: _password.text.trim(),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(MediaQuery.of(context).size.width, 50),
              ),
              child: Text("getStarted".tr),
            ),
          ],
        ),
      ),
    );
  }
}
