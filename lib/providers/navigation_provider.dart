import 'package:flutter_riverpod/flutter_riverpod.dart';

class NavigationProvider extends StateNotifier<NavigationItem> {
  NavigationProvider() : super(NavigationItem.todo);

  changeIndex(int value) {
    state = NavigationItem.values[value];
  }
}

final navigationProvider =
    StateNotifierProvider<NavigationProvider, NavigationItem>((ref) {
  return NavigationProvider();
});

enum NavigationItem {
  todo,
  search,
  analytics,
  settings,
}
