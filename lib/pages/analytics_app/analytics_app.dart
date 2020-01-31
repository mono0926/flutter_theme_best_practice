import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theme_best_practice/models/theme_mode_notifier.dart';
import 'package:theme_best_practice/pages/analytics_app/theme.dart';
import 'package:theme_best_practice/widgets/widgets.dart';

import 'home_page.dart';

class AnalyticsApp extends StatelessWidget {
  const AnalyticsApp({Key key}) : super(key: key);

  static const routeName = '/analytics';

  @override
  Widget build(BuildContext context) {
    return SubApp(
      child: MaterialApp(
        home: const HomePage(),
        theme: buildLightTheme(context),
        darkTheme: buildDarkTheme(context),
        themeMode: context.select((ThemeModeNotifier n) => n.mode),
      ),
    );
  }
}
