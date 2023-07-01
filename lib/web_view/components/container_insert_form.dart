import 'package:flutter/material.dart';

class ContainerInsertForm extends StatefulWidget {
  ContainerInsertForm({
    required this.onFormSubmit,
    Key? key,
  }) : super(key: key);
  final Function(String, String) onFormSubmit;
  @override
  State<ContainerInsertForm> createState() => _ContainerInputFormState();
}

class _ContainerInputFormState extends State<ContainerInsertForm> {
  FontWeight fWeight = FontWeight.bold;
  double fTitleSize = 24;
  double fContentSize = 16;

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
            //controller: ,
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
