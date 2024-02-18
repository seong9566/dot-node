import 'package:flutter/material.dart';

class WidgetItems extends StatefulWidget {
  const WidgetItems({super.key});

  @override
  State<WidgetItems> createState() => _WidgetItemsState();
}

class _WidgetItemsState extends State<WidgetItems> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("widgets"),
    );
  }
}
