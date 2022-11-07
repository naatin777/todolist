import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/data/repositories/theme_repository_impl.dart';
import 'package:todolist/domain/repositories/theme_repository.dart';

class ThemeProvider extends StateNotifier<ThemeMode> {
  ThemeProvider({
    required ThemeMode themeMode,
    required this.themeRepository,
  }) : super(themeMode);

  final ThemeRepository themeRepository;

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
  return ThemeProvider(themeMode: arg, themeRepository: ThemeRepositoryImpl());
});

final themeProvider = StateNotifierProvider<ThemeProvider, ThemeMode>((ref) {
  return throw UnimplementedError();
});
