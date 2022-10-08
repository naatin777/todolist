import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todolist/domain/repositories/theme_repository.dart';

class ThemeRepositoryImpl extends ThemeRepository {
  static const _key = "theme";

  @override
  Future<ThemeMode> getTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final themeMode = prefs.getString(_key);
    switch (themeMode) {
      case "light":
        return ThemeMode.light;
      case "dark":
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }

  @override
  Future<void> setTheme(ThemeMode themeMode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, themeMode.name);
  }
}
