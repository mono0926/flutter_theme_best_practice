import 'package:flutter/material.dart';
import 'package:mono_kit/mono_kit.dart';
import 'package:provider/provider.dart';
import 'package:theme_best_practice/models/theme_mode_notifier.dart';

ThemeData buildLightTheme(BuildContext context) {
  return ThemeData.from(
    colorScheme: const ColorScheme.light(),
    textTheme: _textTheme(isLight: true),
  ).followLatestSpec()._appliedCommon(context);
}

ThemeData buildDarkTheme(BuildContext context) {
  return ThemeData.from(
    colorScheme: const ColorScheme.dark(),
    textTheme: _textTheme(isLight: false),
  ).followLatestSpec()._appliedCommon(context);
}

extension ThemeDataEx on ThemeData {
  ThemeData _appliedCommon(BuildContext context) {
    return copyWith(
      cardTheme: CardTheme(
        elevation: context.select((ThemeModeNotifier n) => n.cardEelevation),
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
