import 'package:flutter/material.dart';
import 'package:my_calculator/components/display.dart';

import '../components/keyboard.dart';

class Calculator extends StatelessWidget {
  const Calculator({Key? key}) : super(key: key);

  _onPressed(String text) {
    print(text);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Column(
        children: <Widget>[
          Display(text: "1223,45"),
          Keyboard(
            cb: _onPressed,
          ),
        ],
      ),
    );
  }
}
