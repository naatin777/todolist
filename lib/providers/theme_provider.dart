import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/data/prefs/theme_prefs.dart';

class ThemeProvider extends StateNotifier<ThemeMode> {
  ThemeProvider() : super(ThemeMode.system);

  setupTheme() async {
    final themePrefs = ThemePrefs();
    state = await themePrefs.loadTheme();
  }

  changeTheme(ThemeMode value) async {
    final themePrefs = ThemePrefs();
    await themePrefs.saveTheme(value);
    state = value;
  }
}

final themeProvider = StateNotifierProvider<ThemeProvider, ThemeMode>((ref) {
  return ThemeProvider();
});
