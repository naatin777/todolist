import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/data/repositories/theme_repository_impl.dart';

class ThemeProvider extends StateNotifier<ThemeMode> {
  ThemeProvider(ThemeMode themeMode) : super(themeMode);

  final themeRepository = ThemeRepositoryImpl();

  static Future<ThemeMode> initialize() async {
    final themeRepository = ThemeRepositoryImpl();
    return themeRepository.getTheme();
  }

  Future<void> changeThemeMode(ThemeMode value) async {
    await themeRepository.setTheme(value);
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
