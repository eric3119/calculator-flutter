import 'package:flutter/material.dart';

import 'keypad.dart';
import '../interpreter/calculator.dart';

class UserInput extends StatefulWidget {
  String display;
  String result;
  Calculator calculator = Calculator();

  UserInput([this.display = '0', this.result = '']);

  @override
  _UserInputState createState() => _UserInputState();
}

class _UserInputState extends State<UserInput> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(10),
            height: MediaQuery.of(context).size.height / 4,
            width: MediaQuery.of(context).size.width,
            child: ListView(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              children: <Widget>[
                Text(
                  widget.display,
                  style: TextStyle(color: Colors.black, fontSize: 50),
                  textAlign: TextAlign.right,
                ),
                Text(
                  widget.result,
                  style: TextStyle(color: Colors.black, fontSize: 50),
                  textAlign: TextAlign.right,
                ),
              ],
            ),
            decoration: BoxDecoration(
              color: Color.fromARGB(50, 121, 156, 110),
              borderRadius: BorderRadius.all(
                Radius.circular(5),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 32,
          ),
          Container(
            // height: MediaQuery.of(context).size.height -
            //     ((MediaQuery.of(context).size.height * 34 - 40) / 120),
            height: (MediaQuery.of(context).size.height - 158) * 3 / 4,
            color: Colors.black,
            child: Keypad(_updateInput, _updateResult),
          ),
        ],
      ),
    );
  }

  void _updateInput(bool add, [String input = '']) {
    if (add) {
      _addChar(input);
    } else {
      _removeChar();
    }
  }

  void _updateResult() {
    setState(() {
      widget.result = widget.calculator.getResult(widget.display);
    });
  }

  void _addChar(String input) {
    setState(() {
      widget.display = widget.calculator.getInput(widget.display + input);
    });
  }

  void _removeChar() {
    setState(() {
      if (widget.display.length != 0) {
        widget.display = widget.calculator
            .getInput(widget.display.substring(0, widget.display.length - 1));
      }
    });
  }
}
