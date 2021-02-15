import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_dev_manager/const.dart';
import 'package:simple_dev_manager/provider/provider.dart';
import 'package:simple_dev_manager/ui/screens/home/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: Consumer<ThemeNotifier>(
        builder: (context, ThemeNotifier notifier, child) {
          return MaterialApp(
            title: 'Simple Dev Manager',
            theme: notifier.dark ? Const.darkTheme : Const.lightTheme,
            darkTheme: Const.darkTheme,
            home: Home(),
          );
        },
      ),
    );
  }
}

// MaterialApp(
// title: 'Simple Dev Manager',
// theme: Const.lightTheme,
// darkTheme: Const.darkTheme,
// home: Home(),
// ),
