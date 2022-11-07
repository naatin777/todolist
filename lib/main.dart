import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/presentation/app.dart';
import 'package:todolist/presentation/providers/theme_provider.dart';
import 'package:todolist/presentation/providers/task_list_navigation_provider.dart';
import 'package:todolist/presentation/widgets/single_touch_container.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(systemNavigationBarColor: Colors.transparent),
  );
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  final themeMode = await ThemeProvider.initialize();
  final taskList = await TaskListNavigationProvider.initialize();
  runApp(
    ProviderScope(
      overrides: [
        themeProvider.overrideWithProvider(
          themeProviderFamily(themeMode),
        ),
        taskListNavigationProvider.overrideWithProvider(
          taskListNavigationProviderFamily(taskList),
        ),
      ],
      child: const SingleTouchContainer(
        child: App(),
      ),
    ),
  );
}
