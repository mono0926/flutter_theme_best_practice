import 'package:enum_to_string/enum_to_string.dart';
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
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          const _ThemeModeMenuButton(),
        ],
      ),
      drawer: const Drawer(),
      floatingActionButton: const _Fab(),
      bottomSheet: const _BottomSheet(),
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
                  child: _buildLeftColumn(),
                ),
                Expanded(
                  child: _buildRightColumn(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLeftColumn() {
    return Column(
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
    );
  }

  Widget _buildRightColumn() {
    return Column(
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
    );
  }
}

class _Fab extends StatelessWidget {
  const _Fab({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('+ tapped'),
        ),
      ),
    );
  }
}

class _BottomSheet extends StatelessWidget {
  const _BottomSheet({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
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
    );
  }
}

class _ThemeModeMenuButton extends StatelessWidget {
  const _ThemeModeMenuButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<ThemeMode>(
      icon: const Icon(Icons.more_vert),
      initialValue: context.select((ThemeModeNotifier n) => n.mode),
      onSelected: (mode) => context.read<ThemeModeNotifier>().mode = mode,
      itemBuilder: (context) {
        return ThemeMode.values.map((mode) {
          return PopupMenuItem(
            value: mode,
            child: Text(EnumToString.convertToString(mode)),
          );
        }).toList();
      },
    );
  }
}
