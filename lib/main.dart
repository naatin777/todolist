import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/app.dart';
import 'package:todolist/components/common/single_touch_container.dart';
import 'package:todolist/providers/theme_provider.dart';
import 'package:todolist/providers/todo_navigation_provider.dart';

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
      child: const SingleTouchContainer(
        child: MyApp(),
      ),
    ),
  );
}
