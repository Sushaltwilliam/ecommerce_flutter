import 'package:ecommerce/models/dark_theme-preference.dart';
import 'package:flutter/material.dart';

class DarkThemeProvider with ChangeNotifier {
  DarkThemePreference darkThemePreference = DarkThemePreference();

  bool _darkTheme = false;
  bool get dartTheme => _darkTheme;

  set darkThemeVal(bool value) {
    _darkTheme = value;
    darkThemePreference.setdarkTheme(value);
    notifyListeners();
  }
}
