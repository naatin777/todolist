import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/presentation/providers/home_navigation_provider.dart';

class AnalyticsBody extends ConsumerWidget {
  const AnalyticsBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeNavigation = ref.watch(homeNavigationProvider);
    if (homeNavigation == NavigationItem.analytics) {
      return Container();
    } else {
      return Container();
    }
  }
}
