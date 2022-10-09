import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/domain/models/multi_select_model.dart';

class MultiSelectProvider extends StateNotifier<MultiSelectModel> {
  MultiSelectProvider() : super(const MultiSelectModel());

  void enable() {
    state = state.copyWith(isSelect: true, item: []);
  }

  void disable() {
    state = state.copyWith(isSelect: false, item: []);
  }

  bool willPop() {
    if (state.isSelect) {
      disable();
      return false;
    } else {
      return true;
    }
  }

  void selectTask(String id) {
    if (state.item.contains(id)) {
      state = state.copyWith(
        item: state.item.where((element) => element != id).toList(),
      );
    } else {
      state = state.copyWith(item: [...state.item, id]);
    }
  }
}

final multiSelectProvider =
    StateNotifierProvider<MultiSelectProvider, MultiSelectModel>((ref) {
  return MultiSelectProvider();
});
