import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:todolist/presentation/pages/home/components/analytics/analytics_body.dart';
import 'package:todolist/presentation/pages/home/components/search/search_body.dart';
import 'package:todolist/presentation/pages/home/components/settings/settings_body.dart';
import 'package:todolist/presentation/pages/home/components/todo/todo_body.dart';
import 'package:todolist/presentation/pages/home/components/todo/todo_fab.dart';
import 'package:todolist/presentation/pages/home/components/todo/todo_drawer.dart';
import 'package:todolist/presentation/providers/multi_select_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Home extends ConsumerStatefulWidget {
  const Home({
    Key? key,
    required this.homeScreen,
    required this.taskListId,
  }) : super(key: key);
  final HomeScreen homeScreen;
  final String taskListId;

  @override
  ConsumerState<Home> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  late String taskListId = widget.taskListId;

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context);
    final multiSelect = ref.watch(multiSelectProvider);
    final homeScreen = widget.homeScreen;

    taskListId = widget.taskListId;
    return WillPopScope(
      child: Scaffold(
        drawer: homeScreen.drawer,
        body: homeScreen.body(taskListId),
        floatingActionButton:
            multiSelect.isSelect ? null : homeScreen.floatingActionButton,
        bottomNavigationBar: NavigationBar(
          selectedIndex: homeScreen.index,
          onDestinationSelected: (int index) {
            GoRouter.of(context).go(
                "/${HomeScreen.values[index].name}?id=${widget.taskListId}");
          },
          destinations: HomeScreen.values
              .map((e) => e.destination(appLocalizations))
              .toList(),
        ),
      ),
      onWillPop: () async {
        return ref.read(multiSelectProvider.notifier).willPop();
      },
    );
  }
}

enum HomeScreen {
  todo,
  search,
  analytics,
  settings,
}

extension on HomeScreen {
  NavigationDestination destination(AppLocalizations? appLocalizations) {
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

  NavigationRailDestination railDestination(
      AppLocalizations? appLocalizations) {
    switch (this) {
      case HomeScreen.todo:
        return NavigationRailDestination(
          icon: const Icon(Icons.check),
          selectedIcon: const Icon(Icons.check_outlined),
          label: Text(appLocalizations!.todo),
        );
      case HomeScreen.search:
        return NavigationRailDestination(
          icon: const Icon(Icons.search),
          selectedIcon: const Icon(Icons.search_outlined),
          label: Text(appLocalizations!.search),
        );
      case HomeScreen.analytics:
        return NavigationRailDestination(
          icon: const Icon(Icons.analytics),
          selectedIcon: const Icon(Icons.analytics_outlined),
          label: Text(appLocalizations!.analytics),
        );
      case HomeScreen.settings:
        return NavigationRailDestination(
          icon: const Icon(Icons.settings),
          selectedIcon: const Icon(Icons.settings_outlined),
          label: Text(appLocalizations!.settings),
        );
    }
  }

  Widget body(String listId) {
    switch (this) {
      case HomeScreen.todo:
        return TodoBody(listId: listId);
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
