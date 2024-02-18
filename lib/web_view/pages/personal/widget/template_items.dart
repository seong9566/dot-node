import 'package:flutter/material.dart';

class TemplateItems extends StatefulWidget {
  const TemplateItems({super.key});

  @override
  State<TemplateItems> createState() => _TemplateItemsState();
}

/// ctrl + w , ctrl shift l
class _TemplateItemsState extends State<TemplateItems> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text("Banner"),
            Text("Layout"),
            Text("List"),
          ],
        )
      ],
    );
  }
}
