import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/presentation/pages/home/components/analytics/analytics_app_bar.dart';
import 'package:todolist/presentation/pages/home/components/analytics/analytics_body.dart';
import 'package:todolist/presentation/pages/home/components/search/search_app_bar.dart';
import 'package:todolist/presentation/pages/home/components/search/search_body.dart';
import 'package:todolist/presentation/pages/home/components/settings/settings_app_bar.dart';
import 'package:todolist/presentation/pages/home/components/settings/settings_body.dart';
import 'package:todolist/presentation/pages/home/components/todo/todo_app_bar.dart';
import 'package:todolist/presentation/pages/home/components/todo/todo_body.dart';
import 'package:todolist/presentation/pages/home/components/todo/todo_fab.dart';
import 'package:todolist/presentation/pages/home/components/todo/todo_drawer.dart';
import 'package:todolist/presentation/providers/home_navigation_provider.dart';
import 'package:todolist/presentation/providers/multi_select_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Home extends ConsumerWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeScreen = ref.watch(homeNavigationProvider);
    return WillPopScope(
      child: Scaffold(
        appBar: homeScreen.appBar,
        drawer: homeScreen.drawer,
        body: Navigator(
          pages: [
            if (HomeScreen.todo == homeScreen)
              const MaterialPage(
                key: ValueKey(HomeScreen.todo),
                child: TodoBody(),
              ),
            if (HomeScreen.search == homeScreen)
              const MaterialPage(
                key: ValueKey(HomeScreen.search),
                child: SearchBody(),
              ),
            if (HomeScreen.analytics == homeScreen)
              const MaterialPage(
                key: ValueKey(HomeScreen.analytics),
                child: AnalyticsBody(),
              ),
            if (HomeScreen.settings == homeScreen)
              const MaterialPage(
                key: ValueKey(HomeScreen.settings),
                child: SettingsBody(),
              ),
          ],
          onPopPage: (route, result) => false,
        ),
        floatingActionButton: homeScreen.floatingActionButton,
        bottomNavigationBar: NavigationBar(
          selectedIndex: homeScreen.index,
          onDestinationSelected: (int index) {
            ref.read(homeNavigationProvider.notifier).changeScreen(index);
          },
          destinations:
              HomeScreen.values.map((e) => e.destination(context)).toList(),
        ),
      ),
      onWillPop: () async {
        return ref.read(multiSelectProvider.notifier).willPop();
      },
    );
  }
}

extension on HomeScreen {
  NavigationDestination destination(context) {
    final appLocalizations = AppLocalizations.of(context);
    switch (this) {
      case HomeScreen.todo:
        return NavigationDestination(
          icon: const Icon(Icons.check),
          selectedIcon: const Icon(Icons.check_outlined),
          label: appLocalizations!.todo,
        );
      case HomeScreen.search:
        return NavigationDestination(
          icon: const Icon(Icons.search),
          selectedIcon: const Icon(Icons.search_outlined),
          label: appLocalizations!.search,
        );
      case HomeScreen.analytics:
        return NavigationDestination(
          icon: const Icon(Icons.analytics),
          selectedIcon: const Icon(Icons.analytics_outlined),
          label: appLocalizations!.analytics,
        );
      case HomeScreen.settings:
        return NavigationDestination(
          icon: const Icon(Icons.settings),
          selectedIcon: const Icon(Icons.settings_outlined),
          label: appLocalizations!.settings,
        );
    }
  }

  PreferredSizeWidget get appBar {
    switch (this) {
      case HomeScreen.todo:
        return const TodoAppBar();
      case HomeScreen.search:
        return const SearchAppBar();
      case HomeScreen.analytics:
        return const AnalyticsAppBar();
      case HomeScreen.settings:
        return const SettingsAppBar();
    }
  }

  Widget? get drawer {
    switch (this) {
      case HomeScreen.todo:
        return const TodoDrawer();
      default:
        return null;
    }
  }

  Widget? get floatingActionButton {
    switch (this) {
      case HomeScreen.todo:
        return const TodoFab();
      default:
        return null;
    }
  }
}
