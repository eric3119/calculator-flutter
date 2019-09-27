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
                  KeyButton('7', updateInput, Colors.transparent,
                      numberKeysColumnSize),
                  KeyButton('8', updateInput, Colors.transparent,
                      numberKeysColumnSize),
                  KeyButton('9', updateInput, Colors.transparent,
                      numberKeysColumnSize),
                ],
              ),
              Row(
                children: <Widget>[
                  KeyButton('4', updateInput, Colors.transparent,
                      numberKeysColumnSize),
                  KeyButton('5', updateInput, Colors.transparent,
                      numberKeysColumnSize),
                  KeyButton('6', updateInput, Colors.transparent,
                      numberKeysColumnSize),
                ],
              ),
              Row(
                children: <Widget>[
                  KeyButton('1', updateInput, Colors.transparent,
                      numberKeysColumnSize),
                  KeyButton('2', updateInput, Colors.transparent,
                      numberKeysColumnSize),
                  KeyButton('3', updateInput, Colors.transparent,
                      numberKeysColumnSize),
                ],
              ),
              Row(
                children: <Widget>[
                  KeyButton('0', updateInput, Colors.transparent,
                      numberKeysColumnSize),
                  KeyButton('.', updateInput, Colors.transparent,
                      numberKeysColumnSize),
                  KeyButton('=', updateResult, Colors.transparent,
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
                updateInput,
                Colors.transparent,
                operationKeysColumnSize,
                textColor: Colors.blue,
              ),
              KeyButton(
                '-',
                updateInput,
                Colors.transparent,
                operationKeysColumnSize,
                textColor: Colors.blue,
              ),
              KeyButton(
                'x',
                updateInput,
                Colors.transparent,
                operationKeysColumnSize,
                textColor: Colors.blue,
              ),
              KeyButton(
                '/',
                updateInput,
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
