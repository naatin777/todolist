import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class ThemePrefs {
  static const key = "theme";

  static final ThemePrefs _instance = ThemePrefs._();

  factory ThemePrefs() {
    return _instance;
  }

  ThemePrefs._();

  Future<ThemeMode> loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final theme = prefs.getString(key);
    switch (theme) {
      case "light":
        return ThemeMode.light;
      case "dark":
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }

  Future<void> saveTheme(ThemeMode themeMode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, themeMode.name);
  }
}
