import 'package:flutter/material.dart';
import 'package:mono_kit/mono_kit.dart';
import 'package:provider/provider.dart';
import 'package:theme_best_practice/models/theme_mode_notifier.dart';
import 'package:theme_best_practice/pages/analytics_app/analytics_card.dart';
import 'package:theme_best_practice/router.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  static const routeName = '/analytics';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pascalCaseFromRouteName(routeName)),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          PopupMenuButton<ThemeMode>(
            icon: Icon(Icons.more_vert),
            initialValue: context.select((ThemeModeNotifier n) => n.mode),
            onSelected: (mode) => context.read<ThemeModeNotifier>().mode = mode,
            itemBuilder: (context) {
              return ThemeMode.values.map((mode) {
                return PopupMenuItem(
                  value: mode,
                  child: Text(enumValueToString(mode)),
                );
              }).toList();
            },
          ),
        ],
      ),
      drawer: const Drawer(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
      ),
      bottomSheet: DraggableScrollableSheet(
        maxChildSize: 0.4,
        minChildSize: 0.25,
        initialChildSize: 0.25,
        expand: false,
        builder: (context, scrollController) {
          final cardElevation =
              context.select((ThemeModeNotifier n) => n.cardElevation);
          return ListView(
            padding: const EdgeInsets.symmetric(vertical: 16),
            controller: scrollController,
            children: <Widget>[
              ListTile(
                title: const Text('Card Elevation'),
                // TODO(mono): テーマ切り替え後に操作すると以下のエラーが出てしまう
                // Looking up a deactivated widget's ancestor is unsafe.
                subtitle: Slider(
                  value: cardElevation,
                  min: 0,
                  max: 10,
                  divisions: 10,
                  onChanged: (value) =>
                      context.read<ThemeModeNotifier>().cardElevation = value,
                  label: '$cardElevation',
                ),
              ),
            ],
          );
        },
      ),
      body: SizedBox.expand(
        child: MaxWidthPaddingBuilder(
          width: 480,
          builder: (context, padding) => SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: padding +
                const EdgeInsets.symmetric(
                  vertical: 4,
                  horizontal: 8,
                ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: const [
                      AnalyticsCard(
                        titleLabel: 'Marketing',
                        valueLabel: '123.4 M',
                      ),
                      AnalyticsCard(
                        titleLabel: 'Conversion',
                        valueLabel: '432.1 M',
                        subValueLabel: '+12.3% of target',
                        showLineChart: true,
                      ),
                      AnalyticsCard(
                        titleLabel: 'Users',
                        valueLabel: '45.5 M',
                        showSaveButton: true,
                      ),
                      AnalyticsCard(
                        titleLabel: 'Sessions',
                        valueLabel: '23,242',
                      ),
                      AnalyticsCard(
                        titleLabel: 'Pageviews',
                        valueLabel: '12,345',
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: const [
                      AnalyticsCard(
                        titleLabel: 'Conversion',
                        valueLabel: '537',
                        subValueLabel: '+22% of target',
                        showBarChart: true,
                      ),
                      ErrorCard(),
                      AnalyticsCard(
                        titleLabel: 'Sales',
                        valueLabel: '345.8 M',
                        subValueLabel: '+11% of target',
                      ),
                      AnalyticsCard(
                        titleLabel: 'Avg. session',
                        valueLabel: '4.53 H',
                        subValueLabel: '+56.6% of target',
                      ),
                      AnalyticsCard(
                        titleLabel: 'Bounce rate',
                        valueLabel: '12%',
                        subValueLabel: '-12.3% of target',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
