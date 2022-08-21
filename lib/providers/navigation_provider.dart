import 'package:flutter_riverpod/flutter_riverpod.dart';

class NavigationProvider extends StateNotifier<int> {
  NavigationProvider() : super(0);

  changeIndex(int value) {
    state = value;
  }
}

final navigationProvider =
    StateNotifierProvider<NavigationProvider, int>((ref) {
  return NavigationProvider();
});
