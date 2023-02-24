import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  static const DARK = Color.fromRGBO(82, 82, 82, 1);
  static const DEFAULT = Color.fromRGBO(112, 112, 112, 1);
  static const OPERATOR = Color.fromRGBO(250, 158, 112, 1);

  final String text;
  final bool big;
  final Color color;
  final void Function(String) cb; //cb == callback

  Button(
      {Key? key,
      required this.text,
      this.big = false,
      this.color = DEFAULT,
      required this.cb})
      : super(key: key);

  //Named constructor with ".name" typo
  Button.big(
      {Key? key,
      required this.text,
      this.big = true,
      this.color = DEFAULT,
      required this.cb})
      : super(key: key);

  Button.operation(
      {Key? key,
      required this.text,
      this.big = false,
      this.color = OPERATOR,
      required this.cb})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: big ? 2 : 1,
        child: OutlinedButton(
            style:
                ButtonStyle(backgroundColor: MaterialStatePropertyAll(color)),
            onPressed: () => cb(text),
            child: Text(
              text,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.w200),
            )));
  }
}
