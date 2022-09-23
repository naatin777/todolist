import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/providers/home_navigation_provider.dart';
import 'package:todolist/components/analytics/analytics_app_bar.dart';
import 'package:todolist/components/analytics/analytics_body.dart';
import 'package:todolist/components/search/search_app_bar.dart';
import 'package:todolist/components/search/search_body.dart';
import 'package:todolist/components/settings/settings_app_bar.dart';
import 'package:todolist/components/settings/settings_body.dart';
import 'package:todolist/components/todo/todo_app_bar.dart';
import 'package:todolist/components/todo/todo_body.dart';
import 'package:todolist/components/todo/todo_fab.dart';
import 'package:todolist/components/todo/todo_drawer.dart';
import 'package:todolist/providers/multi_select_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Home extends ConsumerWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeNavigation = ref.watch(homeNavigationProvider);
    final multiSelect = ref.watch(multiSelectProvider);
    return WillPopScope(
      child: Scaffold(
        appBar: homeNavigation.appBar,
        drawer: homeNavigation.drawer,
        body: Navigator(
          pages: [
            if (NavigationItem.todo == homeNavigation)
              const MaterialPage(
                key: ValueKey(NavigationItem.todo),
                child: TodoBody(),
              ),
            if (NavigationItem.search == homeNavigation)
              const MaterialPage(
                key: ValueKey(NavigationItem.search),
                child: SearchBody(),
              ),
            if (NavigationItem.analytics == homeNavigation)
              const MaterialPage(
                key: ValueKey(NavigationItem.analytics),
                child: AnalyticsBody(),
              ),
            if (NavigationItem.settings == homeNavigation)
              const MaterialPage(
                key: ValueKey(NavigationItem.settings),
                child: SettingsBody(),
              ),
          ],
          onPopPage: (route, result) => false,
        ),
        floatingActionButton: homeNavigation.floatingActionButton,
        bottomNavigationBar: NavigationBar(
          selectedIndex: homeNavigation.index,
          onDestinationSelected: (int index) {
            ref.read(homeNavigationProvider.notifier).changeNavigation(index);
          },
          destinations:
              NavigationItem.values.map((e) => e.destination).toList(),
        ),
      ),
      onWillPop: () async {
        if (multiSelect) {
          ref.read(multiSelectProvider.notifier).onDisable();
          return false;
        } else {
          return true;
        }
      },
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
          label: "Todo",
        );
      case NavigationItem.search:
        return const NavigationDestination(
          icon: Icon(Icons.search),
          selectedIcon: Icon(Icons.search_outlined),
          label: "Search",
        );
      case NavigationItem.analytics:
        return const NavigationDestination(
          icon: Icon(Icons.analytics),
          selectedIcon: Icon(Icons.analytics_outlined),
          label: "Analytics",
        );
      case NavigationItem.settings:
        return const NavigationDestination(
          icon: Icon(Icons.settings),
          selectedIcon: Icon(Icons.settings_outlined),
          label: "Settings",
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
        return const TodoFab();
      default:
        return null;
    }
  }
}
