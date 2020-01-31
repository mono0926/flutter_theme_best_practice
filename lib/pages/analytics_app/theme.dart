import 'package:flutter/material.dart';
import 'package:mono_kit/mono_kit.dart';

ThemeData buildLightTheme() {
  return ThemeData.from(
    colorScheme: const ColorScheme.light(),
    textTheme: _textTheme(isLight: true),
  ).appliedCommon().appliedAnalyticsCommon();
}

ThemeData buildDarkTheme() {
  return ThemeData.from(
    colorScheme: const ColorScheme.dark(),
    textTheme: _textTheme(isLight: false),
  ).appliedCommon().appliedAnalyticsCommon();
}

extension ThemeDataEx on ThemeData {
  ThemeData appliedAnalyticsCommon() {
    return copyWith(
      cardTheme: const CardTheme(
        elevation: 4,
      ),
      buttonTheme: buttonTheme.copyWith(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        buttonColor: colorScheme.onSurfaceVariant,
        textTheme: ButtonTextTheme.primary,
      ),
    );
  }
}

TextTheme _textTheme({@required bool isLight}) {
  final typography = Typography.material2018();
  final theme = isLight ? typography.black : typography.white;
  final defaultStyle = theme.bodyText2;
  final defaultColor = defaultStyle.color;
  return TextTheme(
    headline4: TextStyle(
      color: defaultColor,
    ),
  );
}

extension ColorSchemeEx on ColorScheme {
  Color get onSurfaceVariant =>
      brightness == Brightness.light ? primaryVariant : primary;
}
