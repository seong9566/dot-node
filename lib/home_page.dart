import 'package:flutter/material.dart';

/*
 * Project Name:  [DOTnode]
 * Created Date: 2023-04-29
 * Last Modified: 2023-06-10
 * Author: Hyeonseong
 * Modified By: Hyeonseong
 * copyright @ 2023 TeamDOT
 * --- ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---
 *              Description
 * TODO : 
 * 1. 테스트 코드 모두 본코드로 먼저 이관하기
 * 2. TextField를 만들고 서버에 insert 하기
 * 3. Get요청으로 위젯이 불러와지는지 확인하기. (List에 담겨야함.)
 * 800 , 500 데톱 사이즈임 , 데톱은 좌우 여백이 있는데, 모바일
 * screen util 화면의 사이즈를 변수로 관리 해줌
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
        child: Center(
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
      ),
    );
  }
}
