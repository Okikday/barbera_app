import 'package:flutter/material.dart';


class FlatButton1 extends StatelessWidget {
  final void Function()? onpressed;
  final String? text;
  final Color? color;
  final double? fontSize;
  const FlatButton1({
    super.key,
    this.onpressed,
    this.text,
    this.color,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
          onPressed: onpressed ?? () => debugPrint("No function"),
          child: Text(
            text ?? "",
            style: TextStyle(color: color ?? Colors.white, fontSize: fontSize),
          ),
        );
  }
}