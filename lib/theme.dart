import 'package:flutter/material.dart';
import 'package:mono_kit/mono_kit.dart';

ThemeData buildLightTheme() {
  return ThemeData.from(
    colorScheme: const ColorScheme.light(
      primary: Colors.blue,
      secondary: Colors.lightBlueAccent,
    ),
  ).followLatestSpec();
}

ThemeData buildDarkTheme() {
  return ThemeData.from(
    colorScheme: const ColorScheme.dark(
      secondary: Colors.lightBlueAccent,
    ),
  ).followLatestSpec();
}
