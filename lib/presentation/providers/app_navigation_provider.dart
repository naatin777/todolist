import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppNavigationProvider extends StateNotifier<String?> {
  AppNavigationProvider() : super(null);

  jumpToId(String id) {
    state = id;
  }

  jumpToHome() {
    state = null;
  }
}

final appNavigationProvider =
    StateNotifierProvider<AppNavigationProvider, String?>((ref) {
  return AppNavigationProvider();
});
