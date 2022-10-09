import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/presentation/pages/home/components/analytics/analytics_app_bar.dart';
import 'package:todolist/presentation/pages/home/components/analytics/analytics_body.dart';
import 'package:todolist/presentation/pages/home/components/search/search_app_bar.dart';
import 'package:todolist/presentation/pages/home/components/search/search_body.dart';
import 'package:todolist/presentation/pages/home/components/settings/settings_app_bar.dart';
import 'package:todolist/presentation/pages/home/components/settings/settings_body.dart';
import 'package:todolist/presentation/pages/home/components/todo/todo_body.dart';
import 'package:todolist/presentation/pages/home/components/todo/todo_fab.dart';
import 'package:todolist/presentation/pages/home/components/todo/todo_drawer.dart';
import 'package:todolist/presentation/providers/home_navigation_provider.dart';
import 'package:todolist/presentation/providers/multi_select_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Home extends ConsumerWidget {
  Home({Key? key}) : super(key: key);

  final _pageController = PageController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeScreen = ref.watch(homeNavigationProvider);
    final multiSelect = ref.watch(multiSelectProvider);
    return WillPopScope(
      child: Scaffold(
        appBar: homeScreen.appBar,
        drawer: homeScreen.drawer,
        body: PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          onPageChanged: (value) {
            ref.read(homeNavigationProvider.notifier).changeScreen(value);
          },
          children: HomeScreen.values.map((e) => e.body).toList(),
        ),
        floatingActionButton:
            multiSelect.isSelect ? null : homeScreen.floatingActionButton,
        bottomNavigationBar: multiSelect.isSelect
            ? null
            : NavigationBar(
                selectedIndex: homeScreen.index,
                onDestinationSelected: (int index) {
                  _pageController.animateToPage(
                    index,
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeInOutCubic,
                  );
                },
                destinations: HomeScreen.values
                    .map((e) => e.destination(context))
                    .toList(),
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

  PreferredSizeWidget? get appBar {
    switch (this) {
      case HomeScreen.todo:
        return null;
      case HomeScreen.search:
        return const SearchAppBar();
      case HomeScreen.analytics:
        return const AnalyticsAppBar();
      case HomeScreen.settings:
        return const SettingsAppBar();
    }
  }

  Widget get body {
    switch (this) {
      case HomeScreen.todo:
        return const TodoBody();
      case HomeScreen.search:
        return const SearchBody();
      case HomeScreen.analytics:
        return const AnalyticsBody();
      case HomeScreen.settings:
        return const SettingsBody();
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
