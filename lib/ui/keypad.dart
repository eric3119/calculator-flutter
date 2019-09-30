import 'package:flutter/material.dart';

import 'key_button.dart';

class Keypad extends StatelessWidget {
  final Function updateInput;
  final Function deleteInput;
  final Function updateResult;
  final double numberKeysColumnSize = 4;
  final double operationKeysColumnSize = 5;
  final double keypadLineSize = 5;

  Keypad(this.updateInput, this.updateResult, this.deleteInput);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      child: Row(
        children: <Widget>[
          Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  KeyButton('7', () => updateInput('7'), Colors.transparent,
                      numberKeysColumnSize),
                  KeyButton('8', () => updateInput('8'), Colors.transparent,
                      numberKeysColumnSize),
                  KeyButton('9', () => updateInput('9'), Colors.transparent,
                      numberKeysColumnSize),
                ],
              ),
              Row(
                children: <Widget>[
                  KeyButton('4', () => updateInput('4'), Colors.transparent,
                      numberKeysColumnSize),
                  KeyButton('5', () => updateInput('5'), Colors.transparent,
                      numberKeysColumnSize),
                  KeyButton('6', () => updateInput('6'), Colors.transparent,
                      numberKeysColumnSize),
                ],
              ),
              Row(
                children: <Widget>[
                  KeyButton('1', () => updateInput('1'), Colors.transparent,
                      numberKeysColumnSize),
                  KeyButton('2', () => updateInput('2'), Colors.transparent,
                      numberKeysColumnSize),
                  KeyButton('3', () => updateInput('3'), Colors.transparent,
                      numberKeysColumnSize),
                ],
              ),
              Row(
                children: <Widget>[
                  KeyButton('0', () => updateInput('0'), Colors.transparent,
                      numberKeysColumnSize),
                  KeyButton('.', () => updateInput('.'), Colors.transparent,
                      numberKeysColumnSize),
                  KeyButton('=', () => updateResult(), Colors.transparent,
                      numberKeysColumnSize),
                ],
              ),
            ],
          ),
          Column(),
          Column(
            children: <Widget>[
              KeyButton(
                  Icon(
                    Icons.backspace,
                    color: Colors.blue,
                    size: 35,
                  ),
                  deleteInput,
                  Colors.black,
                  operationKeysColumnSize),
              KeyButton(
                '+',
                () => updateInput('+'),
                Colors.transparent,
                operationKeysColumnSize,
                textColor: Colors.blue,
              ),
              KeyButton(
                '-',
                () => updateInput('-'),
                Colors.transparent,
                operationKeysColumnSize,
                textColor: Colors.blue,
              ),
              KeyButton(
                'x',
                () => updateInput('x'),
                Colors.transparent,
                operationKeysColumnSize,
                textColor: Colors.blue,
              ),
              KeyButton(
                '/',
                () => updateInput('/'),
                Colors.transparent,
                operationKeysColumnSize,
                textColor: Colors.blue,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
