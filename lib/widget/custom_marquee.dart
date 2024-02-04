import 'package:dot_node/core/ui/color_asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/*
 * Project Name:  [DOTnode]
 * Created Date: 2023-10-10
 * Last Modified: 2023-10-28
 * Author: Hyeonseong
 * Modified By: Hyeonseong
 * copyright @ 2023 TeamDOT
 * --- ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---
 *              Description
 *  Marquee App Bar 
 *  Text위젯도 함께 가지고 있음.
 * --- ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---
 */

class CustomMarquee extends StatefulWidget {
  final List<Widget> items;
  final Duration moveDuration;

  const CustomMarquee(
      {super.key,
      required this.items,
      this.moveDuration = const Duration(milliseconds: 100)});

  @override
  _CustomMarqueeState createState() => _CustomMarqueeState();
}

class _CustomMarqueeState extends State<CustomMarquee> {
  late ScrollController _scrollController;
  double _position = 0.0;

  @override
  void initState() {
    _scrollController = ScrollController();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (_scrollController.hasClients) {
        Future.doWhile(_scroll);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 40.w,
      color: DotColor.dotPrimary,
      child: ListView.builder(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Center(
            child: widget.items[index % widget.items.length],
          );
        },
        scrollDirection: Axis.horizontal,
        controller: _scrollController,
        physics: const NeverScrollableScrollPhysics(),
      ),
    );
  }

  Future<bool> _scroll() async {
    double moveDistance = 10;

    _position += moveDistance;
    if (_scrollController.hasClients) {
      _scrollController.animateTo(_position,
          duration: widget.moveDuration, curve: Curves.linear);
    }

    await Future.delayed(widget.moveDuration);
    return true;
  }
}

class MarqueeTest extends StatefulWidget {
  MarqueeTest({
    required this.dotChain,
    required this.str,
    super.key,
  });
  final String dotChain;
  final String str;
  @override
  State<MarqueeTest> createState() => _MarqueeTestState();
}

class _MarqueeTestState extends State<MarqueeTest> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: 20),
            child: Text(
              widget.str,
              style: TextStyle(
                fontFamily: "Akira",
                color: Colors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            width: 180.w,
            padding: EdgeInsets.symmetric(horizontal: 14),
            margin: EdgeInsets.only(right: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                widget.dotChain,
                style: TextStyle(
                  fontFamily: "Akira",
                  color: Colors.grey.shade800,
                  fontSize: 16.sp,
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
