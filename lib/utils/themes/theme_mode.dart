import 'package:flutter/material.dart';

class SelectedThemeChangeNotifier extends ChangeNotifier {
  // Can hold multiple values
  var theme = ThemeMode.system;

  void changeTheme() {
    theme = theme == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    notifyListeners();
  }
}
