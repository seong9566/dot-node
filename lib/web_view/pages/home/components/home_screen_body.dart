import 'package:flutter/material.dart';

import 'animated_app_bar.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          // home/components/custom_app_bar
          MarQueeAppBar(),
        ],
      ),
    );
  }
}
