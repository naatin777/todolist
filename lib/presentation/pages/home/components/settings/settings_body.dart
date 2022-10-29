import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/presentation/pages/home/components/settings/settings_app_bar.dart';
import 'package:todolist/presentation/providers/theme_provider.dart';

class SettingsBody extends ConsumerWidget {
  const SettingsBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    return CustomScrollView(
      slivers: [
        const SettingsAppBar(),
        SliverList(
            delegate: SliverChildListDelegate([
          ExpansionTile(
            title: const Text("Theme"),
            children: ThemeMode.values.map(
              (e) {
                return RadioListTile(
                  value: e,
                  groupValue: theme,
                  onChanged: (value) {
                    ref.read(themeProvider.notifier).changeThemeMode(e);
                  },
                  title: Text(e.name),
                );
              },
            ).toList(),
          )
        ]))
      ],
    );
  }
}
