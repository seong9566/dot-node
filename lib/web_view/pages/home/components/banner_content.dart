import 'package:flutter/material.dart';

/*
 * Project Name:  [DOTnode]
 * Created Date: 2023-10-11
 * Last Modified: 2023-10-11
 * Author: Hyeonseong
 * Modified By: Hyeonseong
 * copyright @ 2023 TeamDOT
 * --- ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---
 *              Description
 * HomeBanner Content
 * 
 * --- ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---
 */

class BannerContent extends StatefulWidget {
  BannerContent(
    this.content, {
    required this.width,
    required this.height,
    required this.color,
    required this.onTap,
    super.key,
  });
  final double width, height;
  final Color color;
  final String? content;
  final VoidCallback onTap;

  @override
  State<BannerContent> createState() => _BannerContentState();
}

class _BannerContentState extends State<BannerContent> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          color: widget.color,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(240),
            bottomRight: Radius.circular(240),
            topLeft: Radius.circular(20),
            bottomLeft: Radius.circular(20),
          ),
        ),
        child: widget.content!.isNotEmpty
            ? Padding(
                padding: EdgeInsets.only(left: 60),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.content!,
                    //"MAIN BANNER IMAGE",
                    style: TextStyle(
                      fontFamily: "Akira",
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            : SizedBox(),
      ),
    );
  }
}
