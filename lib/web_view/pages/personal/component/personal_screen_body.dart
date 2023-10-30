import 'package:dot_node/web_view/pages/personal/component/reorder_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../controller/widget_controller.dart';
import '../../home/model/widget_element_model.dart';
import 'custom_insert_form_modal.dart';

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

class PersonalScreenBody extends ConsumerStatefulWidget {
  const PersonalScreenBody({required this.widgetModel, super.key});
  final WidgetElementModel widgetModel;
  @override
  _PersonalScreenBody createState() => _PersonalScreenBody();
}

class _PersonalScreenBody extends ConsumerState<PersonalScreenBody> {
  @override
  Widget build(BuildContext context) {
    WidgetController wController = ref.read(widgetController);
    return Column(
      children: [
        WigetInsertBtn(wController: wController),
        ReorderWidget(widgetModel: widget.widgetModel),
      ],
    );
  }
}

// 위젯 추가 Btn
class WigetInsertBtn extends StatelessWidget {
  const WigetInsertBtn({
    super.key,
    required this.wController,
  });

  final WidgetController wController;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            //selectedWidget(context, dropDownButtonItems, wController);
            customInsertFormModal(context: context, wControl: wController);
          },
          child: Text("Container 위젯 추가하기"),
        ),
      ],
    );
  }
}
