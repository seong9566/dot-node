import 'package:dot_node/models/widget_model.dart';
import 'package:flutter/material.dart';

class ContainerInputForm extends StatefulWidget {
  ContainerInputForm({
    Key? key,
  }) : super(key: key);

  @override
  State<ContainerInputForm> createState() => _ContainerInputFormState();

  FontWeight fWeight = FontWeight.bold;
  double fTitleSize = 24;
  double fContentSize = 16;
}

class _ContainerInputFormState extends State<ContainerInputForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            style: TextStyle(
              fontSize: fTitleSize,
              fontWeight: fWeight,
            ),
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black,
                  width: 0.1,
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black,
                  width: 0.1,
                ),
              ),
              hintText: '제목을 입력하세요',
            ),
          ),
          TextFormField(
            style: TextStyle(fontSize: fContentSize),
            maxLines: 5,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: '내용을 입력하세요.',
            ),
          ),
        ],
      ),
    );
  }
}
