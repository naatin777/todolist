import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final detailTitleProvider = Provider.autoDispose.family((ref, String arg) {
  return TextEditingController(text: arg);
});
final detailDescriptionProvider =
    Provider.autoDispose.family((ref, String arg) {
  return TextEditingController(text: arg);
});
