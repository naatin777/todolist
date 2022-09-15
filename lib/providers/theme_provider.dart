import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/data/prefs/theme_prefs.dart';

class ThemeProvider extends StateNotifier<ThemeMode> {
  ThemeProvider(ThemeMode themeMode) : super(themeMode);

  static Future<ThemeMode> initialize() async {
    final themePrefs = ThemePrefs();
    return themePrefs.loadTheme();
  }

  Future<void> changeTheme(ThemeMode value) async {
    final themePrefs = ThemePrefs();
    await themePrefs.saveTheme(value);
    state = value;
  }
}

final themeProviderFamily =
    StateNotifierProvider.family<ThemeProvider, ThemeMode, ThemeMode>(
        (ref, arg) {
  return ThemeProvider(arg);
});

final themeProvider = StateNotifierProvider<ThemeProvider, ThemeMode>((ref) {
  return throw UnimplementedError();
});
