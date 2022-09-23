import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/presentation/app.dart';
import 'package:todolist/presentation/providers/theme_provider.dart';
import 'package:todolist/presentation/providers/todo_navigation_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(systemNavigationBarColor: Colors.transparent),
  );
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  final themeMode = await ThemeProvider.initialize();
  final taskList = await TodoNavigationProvider.initialize();
  runApp(
    ProviderScope(
      overrides: [
        themeProvider.overrideWithProvider(
          themeProviderFamily(themeMode),
        ),
        todoNavigationProvider.overrideWithProvider(
          todoNavigationProviderFamily(taskList),
        ),
      ],
      child: const App(),
    ),
  );
}
