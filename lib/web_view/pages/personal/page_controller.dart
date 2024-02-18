import 'package:flutter_riverpod/flutter_riverpod.dart';

final animationPageProvider = Provider((ref) => AnimationPageController(ref));

class AnimationPageController {
  final Ref ref;

  AnimationPageController(this.ref);

  int pageNum = 0;
  double opacity = 1;
  double top = 0;
  Duration animationDuration = const Duration(milliseconds: 200);

  Future<void> next() async {
    if(pageNum == 0){
      await startAnimation(true);
    }
  }

  Future<void> back() async {
    if(pageNum == 1){
      await startAnimation(false);
    }
  }

  Future<void> startAnimation(bool plus) async {
    animationDuration = Duration.zero;
    opacity = 0;
    top = 16;
    if (plus) {
      pageNum++;
    } else {
      pageNum--;
    }
    await Future.delayed(const Duration(milliseconds: 50));
    animationDuration = const Duration(milliseconds: 500);
    opacity = 1;
    top = 0;
  }
}
