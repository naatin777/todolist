import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/providers/home_navigation_provider.dart';
import 'package:todolist/providers/theme_provider.dart';

class SettingsBody extends ConsumerWidget {
  const SettingsBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeNavigation = ref.watch(homeNavigationProvider);
    if (homeNavigation == NavigationItem.settings) {
      final theme = ref.watch(themeProvider);
      return SingleChildScrollView(
        child: Column(
          children: [
            ExpansionTile(
              title: const Text("Theme"),
              children: ThemeMode.values.map(
                (e) {
                  return RadioListTile(
                    value: e,
                    groupValue: theme,
                    onChanged: (value) {
                      ref.read(themeProvider.notifier).changeTheme(e);
                    },
                    title: Text(e.name),
                  );
                },
              ).toList(),
            )
          ],
        ),
      );
    } else {
      return Container();
    }
  }
}
