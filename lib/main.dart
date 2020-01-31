import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:theme_best_practice/models/theme_mode_notifier.dart';

import 'app.dart';
import 'router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        Provider(create: (context) => Router()),
        ChangeNotifierProvider(create: (context) => ThemeModeNotifier()),
      ],
      child: const App(),
    ),
  );
}
