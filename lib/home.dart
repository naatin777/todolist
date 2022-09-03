import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/providers/navigation_provider.dart';
import 'package:todolist/screen/search/search_app_bar.dart';
import 'package:todolist/screen/search/search_body.dart';
import 'package:todolist/screen/settings/settings_app_bar.dart';
import 'package:todolist/screen/settings/settings_body.dart';
import 'package:todolist/screen/todo/todo_app_bar.dart';
import 'package:todolist/screen/todo/todo_body.dart';

class Home extends ConsumerWidget {
  const Home({Key? key}) : super(key: key);

  static const appBar = <PreferredSizeWidget>[
    TodoAppBar(),
    SearchAppBar(),
    TodoAppBar(),
    SettingsAppBar()
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navigationIndex = ref.watch(navigationProvider);
    return Scaffold(
      appBar: appBar[navigationIndex],
      body: Navigator(
        pages: [
          if (navigationIndex == 0)
            const MaterialPage(
              key: ValueKey("0"),
              child: TodoBody(),
            ),
          if (navigationIndex == 1)
            const MaterialPage(
              key: ValueKey("1"),
              child: SearchBody(),
            ),
          if (navigationIndex == 2)
            const MaterialPage(
              key: ValueKey("2"),
              child: TodoBody(),
            ),
          if (navigationIndex == 3)
            const MaterialPage(
              key: ValueKey("3"),
              child: SettingsBody(),
            ),
        ],
        onPopPage: (route, result) => route.didPop(result),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationIndex,
        onDestinationSelected: (int index) {
          ref.read(navigationProvider.notifier).changeIndex(index);
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.check),
            selectedIcon: Icon(Icons.check_outlined),
            label: "todo",
          ),
          NavigationDestination(
            icon: Icon(Icons.search),
            selectedIcon: Icon(Icons.search_outlined),
            label: "search",
          ),
          NavigationDestination(
            icon: Icon(Icons.analytics),
            selectedIcon: Icon(Icons.analytics_outlined),
            label: "analytics",
          ),
          NavigationDestination(
            icon: Icon(Icons.settings),
            selectedIcon: Icon(Icons.settings_outlined),
            label: "settings",
          ),
        ],
      ),
    );
  }
}
