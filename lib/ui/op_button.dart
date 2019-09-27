import 'package:flutter/material.dart';

class OpButton extends StatelessWidget {
  final String op;
  final Widget icon;
  final Function action;

  OpButton(this.op, this.icon, this.action);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: FlatButton(
        child: icon,
        onPressed: () {
          action(true, op);
        },
      ),
    );
  }
}
