import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/presentation/pages/home/components/analytics/analytics_app_bar.dart';

class AnalyticsBody extends ConsumerWidget {
  const AnalyticsBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomScrollView(
      slivers: [
        AnalyticsAppBar()
      ],
    );
  }
}
