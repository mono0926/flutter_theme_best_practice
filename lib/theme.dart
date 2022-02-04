import 'package:flutter/material.dart';
import 'package:mono_kit/mono_kit.dart';

ThemeData lightTheme() {
  return ThemeData(
    colorSchemeSeed: Colors.blue,
    useMaterial3: true,
  ).followLatestSpec();
}

ThemeData darkTheme() {
  return ThemeData(
    colorSchemeSeed: Colors.blue,
    useMaterial3: true,
    brightness: Brightness.dark,
  ).followLatestSpec();
}
