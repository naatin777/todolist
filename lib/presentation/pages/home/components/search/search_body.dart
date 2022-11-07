import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/presentation/pages/home/components/search/search_app_bar.dart';

class SearchBody extends ConsumerWidget {
  const SearchBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const CustomScrollView(
      slivers: [SearchAppBar()],
    );
  }
}
