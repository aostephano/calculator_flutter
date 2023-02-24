import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_calculator/components/display.dart';

import '../components/keyboard.dart';
import '../models/memory.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  final Memory memory = Memory();

  _onPressed(String text) {
    setState(() {
      memory.addCommand(text);
    });
  }

  @override
  Widget build(BuildContext context) {
    //Fixing portrait index
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return MaterialApp(
      home: Column(
        children: <Widget>[
          Display(text: memory.value),
          Keyboard(
            cb: _onPressed,
          ),
        ],
      ),
    );
  }
}
