import 'package:flutter/material.dart';
import 'package:simple_dev_manager/const.dart';
import 'package:simple_dev_manager/ui/screens/home/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Dev Manager',
      theme: Const.darkTheme,
      darkTheme: Const.darkTheme,
      home: Home(),
    );
  }
}
