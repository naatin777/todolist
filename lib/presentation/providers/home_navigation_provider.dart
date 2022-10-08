import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeNavigationProvider extends StateNotifier<HomeScreen> {
  HomeNavigationProvider() : super(HomeScreen.todo);

  changeScreen(int value) {
    state = HomeScreen.values[value];
  }
}

final homeNavigationProvider =
    StateNotifierProvider<HomeNavigationProvider, HomeScreen>((ref) {
  return HomeNavigationProvider();
});

enum HomeScreen {
  todo,
  search,
  analytics,
  settings,
}
