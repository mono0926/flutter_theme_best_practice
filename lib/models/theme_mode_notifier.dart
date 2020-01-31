import 'package:flutter/material.dart';

class ThemeModeNotifier with ChangeNotifier {
  var _mode = ThemeMode.system;
  var _cardElevation = 4.0;

  ThemeMode get mode => _mode;
  double get cardEelevation => _cardElevation;

  set mode(ThemeMode mode) {
    if (_mode == mode) {
      return;
    }
    _mode = mode;
    notifyListeners();
  }

  set cardEelevation(double elevation) {
    if (_cardElevation == elevation) {
      return;
    }
    _cardElevation = elevation;
    notifyListeners();
  }
}
