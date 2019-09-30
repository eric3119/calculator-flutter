import 'package:flutter/material.dart';

class KeyButton extends StatelessWidget {
  final keyBtn;
  final Function action;
  final Color bgColor;
  final Color textColor;
  final double hsize;
  final double wsize;

  KeyButton(this.keyBtn, this.action, this.bgColor, this.hsize,
      {this.wsize = 4, this.textColor = Colors.white});

  @override
  Widget build(BuildContext context) {
    print(context);
    return Container(
      width: (MediaQuery.of(context).size.width - 10) / wsize,
      height: (MediaQuery.of(context).size.height - 10) * 0.52 / hsize,
      child: FlatButton(
        color: bgColor,
        child: buildButton(),
        onPressed: () => action(),
      ),
    );
  }

  Widget buildButton() {
    if (keyBtn.runtimeType == String)
      return Text(
        keyBtn,
        style: TextStyle(
          color: textColor,
          fontSize: 30,
          fontWeight: FontWeight.w300,
        ),
      );
    else
      return keyBtn;
  }
}
