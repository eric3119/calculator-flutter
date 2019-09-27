import 'package:calculator/ui/user_input.dart';
import 'package:flutter/material.dart';

import './ui/user_input.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: UserInput(),
    );
  }
}
