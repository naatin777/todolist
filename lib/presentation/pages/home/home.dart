import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:todolist/presentation/pages/home/components/add_new_task_fab.dart';
import 'package:todolist/presentation/pages/home/components/task_list_drawer.dart';
import 'package:todolist/presentation/pages/home/screens/todo_screen.dart';
import 'package:todolist/presentation/providers/router_provider.dart';

class Home extends ConsumerWidget {
  const Home({super.key, required this.navigationItem});

  final NavigationItem navigationItem;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appLocalizations = AppLocalizations.of(context);
    final isLarge = MediaQuery.of(context).size.width >= 640.0;
    final listId = ref.watch(listIdProvider);
    return Scaffold(
      drawer: navigationItem.drawer,
      body: Row(
        children: [
          if (isLarge)
            SafeArea(
              child: NavigationRail(
                selectedIndex: navigationItem.index,
                onDestinationSelected: (int index) {
                  GoRouter.of(context).go(createHomeRoute(index, listId));
                },
                destinations: NavigationItem.values
                    .map((e) => e.railDestination(appLocalizations))
                    .toList(),
                labelType: NavigationRailLabelType.all,
              ),
            ),
          Expanded(
            child: navigationItem.screen,
          ),
        ],
      ),
      floatingActionButton: navigationItem.fab,
      bottomNavigationBar: isLarge
          ? null
          : NavigationBar(
              selectedIndex: navigationItem.index,
              onDestinationSelected: (int index) {
                GoRouter.of(context).go(createHomeRoute(index, listId));
              },
              destinations: NavigationItem.values
                  .map((e) => e.destination(appLocalizations))
                  .toList(),
            ),
    );
  }
}

enum NavigationItem {
  todo(fab: AddNewTaskFab(), screen: TodoScreen(), drawer: TaskListDrawer()),
  search(fab: null, screen: TodoScreen(), drawer: null),
  analytics(fab: null, screen: TodoScreen(), drawer: null),
  settings(fab: null, screen: TodoScreen(), drawer: null);

  NavigationDestination destination(AppLocalizations? appLocalizations) {
    switch (this) {
      case NavigationItem.todo:
        return NavigationDestination(
          icon: const Icon(Icons.check),
          selectedIcon: const Icon(Icons.check_outlined),
          label: appLocalizations!.todo,
        );
      case NavigationItem.search:
        return NavigationDestination(
          icon: const Icon(Icons.search),
          selectedIcon: const Icon(Icons.search_outlined),
          label: appLocalizations!.search,
        );
      case NavigationItem.analytics:
        return NavigationDestination(
          icon: const Icon(Icons.analytics),
          selectedIcon: const Icon(Icons.analytics_outlined),
          label: appLocalizations!.analytics,
        );
      case NavigationItem.settings:
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
      case NavigationItem.todo:
        return NavigationRailDestination(
          icon: const Icon(Icons.check),
          selectedIcon: const Icon(Icons.check_outlined),
          label: Text(appLocalizations!.todo),
        );
      case NavigationItem.search:
        return NavigationRailDestination(
          icon: const Icon(Icons.search),
          selectedIcon: const Icon(Icons.search_outlined),
          label: Text(appLocalizations!.search),
        );
      case NavigationItem.analytics:
        return NavigationRailDestination(
          icon: const Icon(Icons.analytics),
          selectedIcon: const Icon(Icons.analytics_outlined),
          label: Text(appLocalizations!.analytics),
        );
      case NavigationItem.settings:
        return NavigationRailDestination(
          icon: const Icon(Icons.settings),
          selectedIcon: const Icon(Icons.settings_outlined),
          label: Text(appLocalizations!.settings),
        );
    }
  }

  final Widget? fab;
  final Widget screen;
  final Widget? drawer;

  const NavigationItem({
    required this.fab,
    required this.screen,
    required this.drawer,
  });
}
