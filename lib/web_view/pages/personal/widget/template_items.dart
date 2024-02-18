import 'package:flutter/material.dart';

class TemplateItems extends StatefulWidget {
  const TemplateItems({super.key});

  @override
  State<TemplateItems> createState() => _TemplateItemsState();
}

class _TemplateItemsState extends State<TemplateItems> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("template"),
    );
  }
}
