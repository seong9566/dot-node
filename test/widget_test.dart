import 'package:dot_node/dot_widgets/home_banner.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';

/*
 * Project Name:  [DOTnode]
 * Created Date: 2023-10-30 
 * Last Modified: 2023-10-30
 * Author: Hyeonseong
 * Modified By: Hyeonseong
 * copyright @ 2023 TeamDOT
 * --- ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---
 *              Description
 * 배포 전 꼭 TDD 실행으로 옮기기
 * --- ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---
 */

void main() {
  testWidgets("pageView 테스트", (WidgetTester widgetTester) async {
    widgetTester.pumpWidget(HomeBanner());
  });
}
