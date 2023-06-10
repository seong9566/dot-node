import 'package:dot_node/models/widget_model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';

/*
 * Project Name:  [DOTnode]
 * Created Date: 2023-04-29
 * Last Modified: 2023-06-10
 * Author: Hyeonseong
 * Modified By: Hyeonseong
 * copyright @ 2023 TeamDOT
 * --- ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---
 *              Description
 * Widget을 선택하고 Insert하는 버튼 
 * TextField가 만들어져야함.
 * --- ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---  ---
 */
class InsertWidget extends StatefulBuilder {
  InsertWidget({required this.widgetList, required this.onWidgetAdd, Key? key})
      : super(key: key);
  List<Widget>? widgetList;
  final VoidCallback onWidgetAdd;
  @override
  State<InsertWidget> createState() => _InsertWidget();
}

class _InsertWidget extends State<InsertWidget> {
  String _selectedValue = 'Container';

  void openDialog({required BuildContext context}) async {
    final ImagePicker picker = ImagePicker();
    final ImageProvider? image = await showDialog<ImageProvider>(
      context: context,
      builder: (BuildContext context) {
        String imagePath = '';
        String text = '';

        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              title: const Text('이미지와 텍스트 입력'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("이미지 경로 : $imagePath"),
                  TextField(
                    onChanged: (value) {
                      text = value;
                    },
                    decoration: const InputDecoration(
                      labelText: '설명글',
                    ),
                  ),
                ],
              ),
              actions: [
                ElevatedButton(
                  onPressed: () async {
                    final XFile? imageFile =
                        await picker.pickImage(source: ImageSource.gallery);
                    imagePath = imageFile?.path ?? '';
                    Logger().d("선택 이미지 경로 : $imagePath");
                    setState(() {});
                  },
                  child: const Text('이미지 추가'), // 이미지 추가 버튼
                ),
                ElevatedButton(
                  onPressed: () {
                    addContent(imagePath, text);
                    Navigator.of(context).pop();
                  },
                  child: const Text('추가'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('취소'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  void addContent(String imagePath, String text) {
    setState(
      () {},
    );
  }

  void selectedWidget(BuildContext context, List<String> dropDownButtonItems,
      List<Widget> widgetList) {
    showDialog(
        context: context,
        builder: (BuildContext context) => StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
              return AlertDialog(
                title: const Text('사용할 위젯을 선택하세요.'),
                // dropdown박스 구현하기.
                content: DropdownButton(
                  value: _selectedValue,
                  items: dropDownButtonItems
                      .map<DropdownMenuItem<String>>((value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedValue = value!;
                      Logger().d("selected : ${_selectedValue}");
                    });
                  },
                ),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'Cancel'),
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () => {
                      if (_selectedValue == "Container")
                        {
                          widgetList.add(ContainerWidget()),
                        }
                      else if (_selectedValue == "Stack")
                        {
                          widgetList.add(StackWidget()),
                        }
                      else
                        {
                          widgetList.add(ListWidget()),
                        },
                      Logger().d("위젯 확인 : ${widgetList.length}"),
                      widget.onWidgetAdd(),
                      Navigator.pop(context, 'OK'),
                    },
                    child: const Text('OK'),
                  ),
                ],
              );
            }));
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetList = widget.widgetList!;
    List<String> dropDownButtonItems = <String>["Container", "Stack", "List"];
    return ElevatedButton(
      onPressed: () => selectedWidget(context, dropDownButtonItems, widgetList),
      child: const Text('위젯 추가'),
    );
  }
}
