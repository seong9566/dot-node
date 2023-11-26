import 'package:dot_node/template/peaches/peaches.dart';
import 'package:flutter/material.dart';

class BariSmallBanner extends StatelessWidget {
  const BariSmallBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: smallBanners.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5, //1 개의 행에 보여줄 item 개수
        childAspectRatio: 0.8 / 1, //item 의 가로 1, 세로 1 의 비율
        mainAxisSpacing: 10, //수평 Padding
        crossAxisSpacing: 10, //수직 Padding
      ),
      itemBuilder: (BuildContext context, int index) {
        return Container(
          // width: 20,
          //height: 100,
          color: Colors.amber,
          child: Text(smallBanners[index].text),
        );
      },
    );
  }
}
