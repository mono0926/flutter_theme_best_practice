import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theme_best_practice/models/theme_mode_notifier.dart';

import 'pages/pages.dart';
import 'router.dart';
import 'theme.dart';

class App extends StatelessWidget {
  const App();

  @override
  Widget build(BuildContext context) {
    const title = 'mono_kit Demo';
    return MaterialApp(
      theme: buildLightTheme(),
      darkTheme: buildDarkTheme(),
      themeMode: context.select((ThemeModeNotifier n) => n.mode),
      title: title,
      home: const HomePage(),
      onGenerateRoute: Provider.of<Router>(context).onGenerateRoute,
    );
  }
}
