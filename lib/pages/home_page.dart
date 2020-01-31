import 'package:flutter/material.dart';
import 'package:theme_best_practice/pages/setting_page.dart';

import '../router.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Best Practice'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () =>
                Navigator.of(context).pushNamed(SettingPage.routeName),
          )
        ],
      ),
      body: ListView(
        children: PageInfo.all.map((info) {
          final routeName = info.routeName;
          return ListTile(
            title: Text(pascalCaseFromRouteName(routeName)),
            trailing: Icon(Icons.chevron_right),
            onTap: () => Navigator.of(context).pushNamed(routeName),
          );
        }).toList(),
      ),
    );
  }
}
