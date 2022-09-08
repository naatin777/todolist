import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/providers/navigation_provider.dart';
import 'package:todolist/screen/analytics/analytics_app_bar.dart';
import 'package:todolist/screen/analytics/analytics_body.dart';
import 'package:todolist/screen/search/search_app_bar.dart';
import 'package:todolist/screen/search/search_body.dart';
import 'package:todolist/screen/settings/settings_app_bar.dart';
import 'package:todolist/screen/settings/settings_body.dart';
import 'package:todolist/screen/todo/todo_app_bar.dart';
import 'package:todolist/screen/todo/todo_body.dart';
import 'package:todolist/screen/todo/todo_button.dart';
import 'package:todolist/screen/todo/todo_drawer.dart';

class Home extends ConsumerWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navigationIndex = ref.watch(navigationProvider);
    return Scaffold(
      appBar: navigationIndex.appBar,
      drawer: navigationIndex.drawer,
      body: Navigator(
        pages: [navigationIndex.page],
        onPopPage: (route, result) => route.didPop(result),
      ),
      floatingActionButton: navigationIndex.floatingActionButton,
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationIndex.index,
        onDestinationSelected: (int index) {
          ref.read(navigationProvider.notifier).changeIndex(index);
        },
        destinations: NavigationItem.values.map((e) => e.destination).toList(),
      ),
    );
  }
}

extension on NavigationItem {
  NavigationDestination get destination {
    switch (this) {
      case NavigationItem.todo:
        return const NavigationDestination(
          icon: Icon(Icons.check),
          selectedIcon: Icon(Icons.check_outlined),
          label: "todo",
        );
      case NavigationItem.search:
        return const NavigationDestination(
          icon: Icon(Icons.search),
          selectedIcon: Icon(Icons.search_outlined),
          label: "search",
        );
      case NavigationItem.analytics:
        return const NavigationDestination(
          icon: Icon(Icons.analytics),
          selectedIcon: Icon(Icons.analytics_outlined),
          label: "analytics",
        );
      case NavigationItem.settings:
        return const NavigationDestination(
          icon: Icon(Icons.settings),
          selectedIcon: Icon(Icons.settings_outlined),
          label: "settings",
        );
    }
  }

  PreferredSizeWidget get appBar {
    switch (this) {
      case NavigationItem.todo:
        return const TodoAppBar();
      case NavigationItem.search:
        return const SearchAppBar();
      case NavigationItem.analytics:
        return const AnalyticsAppBar();
      case NavigationItem.settings:
        return const SettingsAppBar();
    }
  }

  MaterialPage get page {
    switch (this) {
      case NavigationItem.todo:
        return const MaterialPage(
          key: ValueKey("0"),
          child: TodoBody(),
        );
      case NavigationItem.search:
        return const MaterialPage(
          key: ValueKey("1"),
          child: SearchBody(),
        );
      case NavigationItem.analytics:
        return const MaterialPage(
          key: ValueKey("2"),
          child: AnalyticsBody(),
        );
      case NavigationItem.settings:
        return const MaterialPage(
          key: ValueKey("3"),
          child: SettingsBody(),
        );
    }
  }

  Widget? get drawer {
    switch (this) {
      case NavigationItem.todo:
        return const TodoDrawer();
      default:
        return null;
    }
  }

  Widget? get floatingActionButton {
    switch (this) {
      case NavigationItem.todo:
        return const TodoButton();
      default:
        return
          null;
    }
  }
}
