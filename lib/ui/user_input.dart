import 'package:flutter/material.dart';

import 'keypad.dart';
import '../interpreter/calculator.dart';

class UserInput extends StatefulWidget {
  String display;
  String result;
  Calculator calculator = Calculator();

  UserInput([this.display = '', this.result = '']);

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
            margin: EdgeInsets.only(top: 10, left: 5, right: 5),
            height: (MediaQuery.of(context).size.height - 20) * 0.12,
            width: MediaQuery.of(context).size.width,
            child: ListView(
              reverse: true,
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Text(
                  widget.display,
                  style: TextStyle(color: Colors.black, fontSize: 50),
                ),
              ],
            ),
            decoration: BoxDecoration(
              color: Color.fromARGB(50, 121, 156, 110),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5),
                topRight: Radius.circular(5),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 10, left: 5, right: 5),
            height: (MediaQuery.of(context).size.height - 20) * 0.12,
            width: MediaQuery.of(context).size.width,
            child: ListView(
              reverse: true,
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Text(
                  widget.result,
                  style: TextStyle(color: Colors.black, fontSize: 50),
                ),
              ],
            ),
            decoration: BoxDecoration(
              color: Color.fromARGB(50, 121, 156, 110),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(5),
                bottomRight: Radius.circular(5),
              ),
            ),
          ),
          SizedBox(
            height: (MediaQuery.of(context).size.height - 20) * 0.06,
          ),
          Container(
            height: (MediaQuery.of(context).size.height - 20) * 0.56,
            color: Colors.black,
            child: Keypad(_updateInput, _updateResult, _deleteInput),
          ),
        ],
      ),
    );
  }

  void _updateInput(String input) {
    setState(() {
      widget.display = widget.calculator.getInput(widget.display + input);
      String res = widget.calculator.getResult(widget.display);
      if (res != '') widget.result = res;
    });
  }

  void _updateResult() {
    setState(() {
      if (widget.calculator.strErr != '') {
        widget.result = widget.calculator.strErr;
      } else {
        widget.display = widget.calculator.getResult(widget.display);
        widget.result = '';
      }
    });
  }

  void _deleteInput() {
    setState(() {
      if (widget.display.length != 0) {
        widget.display = widget.calculator
            .getInput(widget.display.substring(0, widget.display.length - 1));

        String res = widget.calculator.getResult(widget.display);
        if (res != '') widget.result = res;
      }
    });
  }
}
