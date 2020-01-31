import 'package:flutter/material.dart';
import 'package:mono_kit/mono_kit.dart';

ThemeData buildLightTheme() {
  return ThemeData.from(
    colorScheme: ColorScheme.light(
      primary: Colors.blue,
      secondary: Colors.lightBlueAccent,
    ),
  ).appliedCommon();
}

ThemeData buildDarkTheme() {
  return ThemeData.from(
    colorScheme: ColorScheme.dark(
      secondary: Colors.lightBlueAccent,
    ),
  ).appliedCommon();
}
