import 'package:dot_node/web_view/pages/personal/personal_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../components/custom_app_bar.dart';

/*
 * Project Name:  [DOTnode]
 * Created Date: 2023-04-29
 * Last Modified: 2023-06-27
 * Author: Hyeonseong
 * Modified By: Hyeonseong
 * copyright @ 2023 TeamDOT
 * --- ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---
 *              Description
 * TODO : 
 * 2. TextField를 만들고 서버에 insert 하기
 * 3. Get요청으로 위젯이 불러와지는지 확인하기. (List에 담겨야함.)
 * 800 , 500 데톱 사이즈 , 데톱은 좌우 여백이 있는데, 모바일
 * screen util 화면의 사이즈를 변수로 관리 해줌
 * WidgetElement데이터 가공을 위한 Provider 추가.
 * --- ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---
 */

class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  List<Widget>? widgetLists = [];

  final FontWeight fWeight = FontWeight.bold;
  final double fTitleSize = 24;
  final double fContentSize = 16;
  final double fHeight = 400;
  final double fWidth = 600;

  @override
  Widget build(BuildContext context) {
    //final wControl = ref.read(widgetController);
    //final uModel = ref.watch(userWidgetViewModel.notifier);
    //WidgetElementModel? widgetModel = ref.watch(userWidgetViewModel);
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    // if (widgetModel == null) {
    //   return Center(child: CircularProgressIndicator());
    // }
    return Scaffold(
      appBar: CustomAppBar(scaffoldKey: scaffoldKey),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Divider(
              height: 2,
              color: Colors.grey.shade400,
            ),
            SizedBox(height: 100.h),
            ElevatedButton(
              onPressed: () {
                Get.to(PersonalPage());
              },
              child: Text("개인페이지"),
            ),
          ],
        ),
      ),
    );
    // return Scaffold(
    //   body: Padding(
    //     padding: const EdgeInsets.all(30.0),
    //     child: ListView.builder(
    //       itemCount: widgetLists!.length + 1,
    //       itemBuilder: (context, index) {
    //         if (index == widgetLists!.length) {
    //           return Column(
    //             children: [
    //               ElevatedButton(
    //                 onPressed: () {
    //                   wControl.getWidget(userName: "youngmin");
    //                 },
    //                 child: Text("Get요청"),
    //               ),
    //               SizedBox(height: 20),
    //               InsertWidget(
    //                 widgetList: widgetLists,
    //                 wControl: wControl,
    //                 onWidgetAdd: () {
    //                   setState(() {});
    //                 },
    //               ),
    //             ],
    //           );
    //         } else {
    //           return Padding(
    //             padding: const EdgeInsets.symmetric(vertical: 20),
    //             child: widgetLists![index],
    //           );
    //         }
    //       },
    //     ),
    //   ),
    // );
  }
}