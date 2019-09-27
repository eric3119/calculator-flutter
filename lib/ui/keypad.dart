import 'package:flutter/material.dart';

import 'number_button.dart';

class Keypad extends StatelessWidget {
  final Function updateInput;
  final Function updateResult;
  final double numberKeysColumnSize = 4;
  final double operationKeysColumnSize = 5;
  final double keypadLineSize = 5;

  Keypad(this.updateInput, this.updateResult);

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
                  NumberButton('7', updateInput, Colors.transparent,
                      numberKeysColumnSize),
                  NumberButton('8', updateInput, Colors.transparent,
                      numberKeysColumnSize),
                  NumberButton('9', updateInput, Colors.transparent,
                      numberKeysColumnSize),
                ],
              ),
              Row(
                children: <Widget>[
                  NumberButton('4', updateInput, Colors.transparent,
                      numberKeysColumnSize),
                  NumberButton('5', updateInput, Colors.transparent,
                      numberKeysColumnSize),
                  NumberButton('6', updateInput, Colors.transparent,
                      numberKeysColumnSize),
                ],
              ),
              Row(
                children: <Widget>[
                  NumberButton('1', updateInput, Colors.transparent,
                      numberKeysColumnSize),
                  NumberButton('2', updateInput, Colors.transparent,
                      numberKeysColumnSize),
                  NumberButton('3', updateInput, Colors.transparent,
                      numberKeysColumnSize),
                ],
              ),
              Row(
                children: <Widget>[
                  NumberButton('0', updateInput, Colors.transparent,
                      numberKeysColumnSize),
                  NumberButton(',', updateInput, Colors.transparent,
                      numberKeysColumnSize),
                  NumberButton('=', updateResult, Colors.transparent,
                      numberKeysColumnSize),
                ],
              ),
            ],
          ),
          Column(),
          Column(
            children: <Widget>[
              NumberButton(
                  Icon(
                    Icons.backspace,
                    color: Colors.blue,
                    size: 35,
                  ),
                  () => updateInput(false),
                  Colors.black,
                  operationKeysColumnSize),
              NumberButton(
                '+',
                updateInput,
                Colors.transparent,
                operationKeysColumnSize,
                textColor: Colors.blue,
              ),
              NumberButton(
                '-',
                updateInput,
                Colors.transparent,
                operationKeysColumnSize,
                textColor: Colors.blue,
              ),
              NumberButton(
                'x',
                updateInput,
                Colors.transparent,
                operationKeysColumnSize,
                textColor: Colors.blue,
              ),
              NumberButton(
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
