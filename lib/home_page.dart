import 'package:flutter/material.dart';

// 800 , 500 데톱 사이즈임 , 데톱은 좌우 여백이 있는데, 모바일
// screen util 화면의 사이즈를 변수로 관리 해줌
//
/*
 * Project Name:  [DOTnode]
 * Created Date: 2023-04-29 14:07:48
 * Last Modified: 2023-04-30 00:11:44
 * Author: Hyeonseong
 * Modified By: Hyeonseong
 * copyright @ 2023 TeamDOT
 * --- ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---
 *              Description
 * --- ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---
 */
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HomePage"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.yellow,
              width: 800,
              height: 500,
            ),
            Container(
              color: Colors.green,
              width: 800,
              height: 500,
            ),
            Container(
              color: Colors.blue,
              width: 800,
              height: 500,
            ),
          ],
        ),
      ),
    );
  }
}
