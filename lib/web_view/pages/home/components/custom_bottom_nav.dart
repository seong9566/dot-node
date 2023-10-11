import 'package:flutter/material.dart';

class CustomBottomNav extends StatelessWidget {
  const CustomBottomNav({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: EdgeInsets.only(bottom: 100),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12), // 안쪽의 여백
            margin: const EdgeInsets.only(left: 24),
            decoration: BoxDecoration(
              color: Colors.grey.shade800,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "DOT",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Akira",
                    fontSize: 16,
                  ),
                ),
                SizedBox(width: 10),
                SizedBox(
                  height: 8,
                  child: VerticalDivider(color: Colors.white),
                ),
                SizedBox(width: 10),
                Text(
                  "WORK",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Akira",
                    fontSize: 16,
                  ),
                ),
                SizedBox(width: 10),
                SizedBox(
                  height: 8,
                  child: VerticalDivider(color: Colors.white),
                ),
                SizedBox(width: 10),
                Text(
                  "JOB",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Akira",
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.zero,
            padding: EdgeInsets.zero,
            width: 30,
            height: 8,
            color: Colors.grey.shade800,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.grey.shade800,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
            ),
            child: Text(
              "MY PAGE",
              style: TextStyle(
                color: Colors.white,
                fontFamily: "Akira",
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
