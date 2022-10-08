import 'package:flutter_riverpod/flutter_riverpod.dart';

class MultiSelectProvider extends StateNotifier<bool> {
  MultiSelectProvider() : super(false);

  void enable() {
    state = true;
  }

  void disable() {
    state = false;
  }

  bool willPop() {
    if (state) {
      disable();
      return false;
    } else {
      return true;
    }
  }
}

final multiSelectProvider =
    StateNotifierProvider<MultiSelectProvider, bool>((ref) {
  return MultiSelectProvider();
});
