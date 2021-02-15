import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Const {
  //Colors for theme
  static Color lightPrimary = Color(0xfffcfcff);
  static Color darkPrimary = Colors.black;
  static Color lightAccent = Color(0xff5563ff);
  static Color darkAccent = Color(0xff5563ff);
  static Color lightBG = Color(0xfffcfcff);
  static Color darkBG = Colors.black54;
  static Color ratingBG = Colors.yellow[600];

  static var subtitle = TextStyle(
    fontSize: 14,
  );
  static var title = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );
  static ThemeData lightTheme = ThemeData(
    backgroundColor: lightBG,
    primaryColor: lightPrimary,
    accentColor: lightAccent,
    cursorColor: lightAccent,
    scaffoldBackgroundColor: lightBG,
    appBarTheme: AppBarTheme(
      textTheme: TextTheme(
        headline6: TextStyle(
          color: darkBG,
          fontSize: 18.0,
          fontWeight: FontWeight.w800,
        ),
      ),
    ),
  );
  static var darkTheme = ThemeData(
    brightness: Brightness.dark,
    backgroundColor: darkBG,
    primaryColor: darkPrimary,
    accentColor: darkAccent,
    scaffoldBackgroundColor: darkBG,
    cursorColor: darkAccent,
    appBarTheme: AppBarTheme(
      textTheme: TextTheme(
        headline6: TextStyle(
          color: Colors.white,
          fontSize: 18.0,
          fontWeight: FontWeight.w800,
        ),
      ),
    ),
  );
}

class ThemeNotifier extends ChangeNotifier {
  final String key = 'theme';
  SharedPreferences _prefs;
  bool _darkTheme;
  bool get dark => _darkTheme;

  ThemeNotifier() {
    _darkTheme = true;
    _loadfromPrefs();
  }
  toggleTheme() {
    _darkTheme = !_darkTheme;
    _saveToPrefs();
    notifyListeners();
  }

  _initPrefs() async {
    if (_prefs == null) _prefs = await SharedPreferences.getInstance();
  }

  _loadfromPrefs() async {
    await _initPrefs();
    _darkTheme = _prefs.getBool(key) ?? true;
    notifyListeners();
  }

  _saveToPrefs() async {
    await _initPrefs();
    _prefs.setBool(key, _darkTheme);
  }
}
