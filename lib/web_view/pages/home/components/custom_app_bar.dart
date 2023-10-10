import 'package:dot_node/web_view/pages/home/components/app_bar_model.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

@override
void initState() {}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: 32,
      color: Colors.grey.shade800,
      //row 아래 ListView의 Axis.horizontal가 중첩되기 때문에 사용금지.
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        itemCount: appBarTextList.length,
        itemBuilder: (context, index) => AppBarText(
          dotChain: appBarTextList[index].dotChain,
          str: appBarTextList[index].str,
        ),
      ),
    );
  }
}

class AppBarText extends StatefulWidget {
  AppBarText({
    required this.dotChain,
    required this.str,
    super.key,
  });
  final String dotChain;
  final String str;

  @override
  State<AppBarText> createState() => _AppBarTextState();
}

class _AppBarTextState extends State<AppBarText> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 12),
    );

    _animation = Tween<double>(
      begin: -1.0, // 시작 위치 (왼쪽 화면 밖)
      end: 1.0, // 끝 위치 (오른쪽 화면 밖)
    ).animate(_controller);

    _controller.repeat(); // 애니메이션을 반복하도록 설정
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) => Transform.translate(
        offset: Offset(_animation.value * MediaQuery.of(context).size.width, 0),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 2),
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.only(right: 20),
                child: Text(
                  widget.str,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                width: 120,
                padding: EdgeInsets.symmetric(horizontal: 14),
                margin: EdgeInsets.only(right: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    widget.dotChain,
                    style: TextStyle(
                      color: Colors.grey.shade800,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
