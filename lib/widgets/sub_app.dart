import 'package:flutter/material.dart';
import 'package:nested/nested.dart';

class SubApp extends SingleChildStatelessWidget {
  const SubApp({
    Key key,
    @required Widget child,
  }) : super(
          key: key,
          child: child,
        );

  @override
  Widget buildWithChild(BuildContext context, Widget child) {
    return Stack(
      children: <Widget>[
        child,
        Align(
          alignment: Alignment.bottomLeft,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: FloatingActionButton.extended(
                heroTag: 'Root App Hero Tag',
                onPressed: () => Navigator.of(context).pop(),
                label: const Text('Back'),
                icon: const BackButtonIcon(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
