import 'package:flutter/material.dart';
import 'package:mono_kit/mono_kit.dart';
import 'package:recase/recase.dart';
import 'package:theme_best_practice/pages/analytics_app/analytics_app.dart';
import 'package:theme_best_practice/pages/setting_page.dart';

import 'util/util.dart';

typedef WidgetPageBuilder = Widget Function(
  BuildContext context,
  RouteSettings settings,
);

// ignore: avoid_classes_with_only_static_members
class Router {
  static const root = '/';

  final _routes = <String, WidgetPageBuilder>{
    AnalyticsApp.routeName: (context, settings) => const AnalyticsApp(),
  };
  final _fadeRoutes = <String, WidgetPageBuilder>{};
  final _modalRoutes = <String, WidgetPageBuilder>{
    SettingPage.routeName: (context, settings) => const SettingPage(),
  };

  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    logger.info(settings.name);
    var pageBuilder = _routes[settings.name];
    if (pageBuilder != null) {
      return MaterialPageRoute<void>(
        builder: (context) => pageBuilder!(context, settings),
        settings: settings,
      );
    }
    pageBuilder = _fadeRoutes[settings.name];
    if (pageBuilder != null) {
      return FadePageRoute<void>(
        builder: (context) => pageBuilder!(context, settings),
        settings: settings,
      );
    }

    pageBuilder = _modalRoutes[settings.name];
    if (pageBuilder != null) {
      return MaterialPageRoute<void>(
        builder: (context) => pageBuilder!(context, settings),
        settings: settings,
        fullscreenDialog: true,
      );
    }
    throw UnexpectedError('unexpected settings: $settings');
  }
}

String pascalCaseFromRouteName(String name) => name.substring(1).pascalCase;

@immutable
class PageInfo {
  const PageInfo({
    required this.routeName,
  });

  final String routeName;

  static const all = [
    PageInfo(routeName: AnalyticsApp.routeName),
  ];
}
