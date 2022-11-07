import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AnalyticsAppBar extends StatelessWidget {
  const AnalyticsAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context);
    return SliverAppBar(
      title: Text(appLocalizations!.analytics),
    );
  }
}
