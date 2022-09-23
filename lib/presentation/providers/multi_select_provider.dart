import 'package:flutter_riverpod/flutter_riverpod.dart';

class MultiSelectProvider extends StateNotifier<bool> {
  MultiSelectProvider() : super(false);

  onSelect() => state = true;

  onDisable() => state = false;
}

final multiSelectProvider =
    StateNotifierProvider<MultiSelectProvider, bool>((ref) {
  return MultiSelectProvider();
});
