import 'package:flutter/material.dart';

import '../../../../constant.dart';
import '../../../../models/widget_model.dart';
import '../../home/model/widget_element_model.dart';

/*
 * Project Name:  [DOTnode]
 * Created Date: 2023-10-30
 * Last Modified: 2023-10-30
 * Author: Hyeonseong
 * Modified By: Hyeonseong
 * copyright @ 2023 TeamDOT
 * --- ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---
 *              Description
 * 
 * 10.30 : 코드 리펙토링 진행 (컴포넌트화)
 * --- ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---
 */

class ReorderWidget extends StatefulWidget {
  const ReorderWidget({required this.widgetModel, super.key});
  final WidgetElementModel widgetModel;

  @override
  State<ReorderWidget> createState() => _ReorderWidgetState();
}

class _ReorderWidgetState extends State<ReorderWidget> {
  @override
  Widget build(BuildContext context) {
    return ReorderableListView.builder(
      buildDefaultDragHandles: false,
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      itemCount: widget.widgetModel.widgetElementList.length, //Element의 갯수만큼
      itemBuilder: (context, index) {
        final data = widget.widgetModel.widgetElementList[index];
        if (data.widgetName == "ContainerWidget") {
          return ListTile(
            key: ValueKey(data), // 각 위젯의 고유한 Key를 사용
            title: ContainerWidget(
              model: data,
            ),
            leading: ReorderableDragStartListener(
              index: index,
              child: Icon(
                Icons.drag_handle,
                color: Colors.white,
              ),
            ),
            tileColor: firstBackGroundColor,
            shape: RoundedRectangleBorder(
              side: BorderSide.none,
            ),
          );
        }
        // "ContainerWidget"가 아닌 경우 빈 위젯을 반환하거나 다른 위젯을 사용
        return SizedBox.shrink();
      },
      onReorder: (oldIndex, newIndex) {
        setState(() {
          if (oldIndex < newIndex) {
            newIndex--;
          }
          final item = widget.widgetModel.widgetElementList.removeAt(oldIndex);
          widget.widgetModel.widgetElementList.insert(newIndex, item);
        });
      },
    );
  }
}
