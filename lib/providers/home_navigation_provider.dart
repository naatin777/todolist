import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeNavigationProvider extends StateNotifier<NavigationItem> {
  HomeNavigationProvider() : super(NavigationItem.todo);

  changeNavigation(int value) {
    state = NavigationItem.values[value];
  }
}

final homeNavigationProvider =
    StateNotifierProvider<HomeNavigationProvider, NavigationItem>((ref) {
  return HomeNavigationProvider();
});

enum NavigationItem {
  todo,
  search,
  analytics,
  settings,
}
