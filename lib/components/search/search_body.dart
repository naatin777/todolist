import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/providers/home_navigation_provider.dart';

class SearchBody extends ConsumerWidget {
  const SearchBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeNavigation = ref.watch(homeNavigationProvider);
    if (homeNavigation == NavigationItem.search) {
      return Container();
    } else {
      return Container();
    }
  }
}
