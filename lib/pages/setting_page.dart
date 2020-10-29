import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theme_best_practice/models/theme_mode_notifier.dart';
import 'package:theme_best_practice/router.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key key}) : super(key: key);

  static const routeName = '/setting';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pascalCaseFromRouteName(routeName)),
      ),
      body: ListView(
        children: const [
          _ThemeSwitchTile(),
        ],
      ),
    );
  }
}

class _ThemeSwitchTile extends StatelessWidget {
  const _ThemeSwitchTile({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text('Theme Mode'),
      trailing: DropdownButton<ThemeMode>(
        value: context.select((ThemeModeNotifier n) => n.mode),
        onChanged: (mode) => context.read<ThemeModeNotifier>().mode = mode,
        items: ThemeMode.values
            .map((value) => DropdownMenuItem(
                  value: value,
                  child: Text(EnumToString.convertToString(value)),
                ))
            .toList(),
      ),
    );
  }
}
