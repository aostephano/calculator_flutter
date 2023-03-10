import 'package:flutter/material.dart';

import 'button.dart';

class ButtonRow extends StatelessWidget {
  final List<Button> buttons;

  const ButtonRow({Key? key, required this.buttons}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: buttons.fold(<Widget>[], (list, element) {
          list.isEmpty
              ? list.add(element)
              : list.addAll([SizedBox(width: 1), element]);
          return list;
        }),
      ),
    );
  }
}
