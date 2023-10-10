import 'package:dot_node/web_view/pages/home/components/app_bar_model.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

/*
 * Project Name:  [DOTnode]
 * Created Date: 2023-10-10
 * Last Modified: 2023-10-10
 * Author: Hyeonseong
 * Modified By: Hyeonseong
 * copyright @ 2023 TeamDOT
 * --- ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---
 *              Description
 * 
 * --- ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---
 */

class MarQueeAppBar extends StatefulWidget {
  const MarQueeAppBar({
    super.key,
    this.moveDuration = const Duration(milliseconds: 100),
  });
  final Duration moveDuration;

  @override
  State<MarQueeAppBar> createState() => _MarQueeAppBarState();
}

class _MarQueeAppBarState extends State<MarQueeAppBar> {
  late ScrollController _scrollController;

  Future<bool> _scroll() async {
    Logger().d("scroll");
    return true;
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Logger().d("콜백 함수 실행");
      Future.doWhile(_scroll);
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: 32,
      color: Colors.grey.shade800,
      //row 아래 ListView의 Axis.horizontal가 중첩되기 때문에 사용금지.
      child: ListView.builder(
        controller: _scrollController,
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

class _AppBarTextState extends State<AppBarText> {
  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}
