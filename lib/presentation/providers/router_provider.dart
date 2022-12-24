import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:todolist/constant.dart';
import 'package:todolist/presentation/pages/detail/detail.dart';
import 'package:todolist/presentation/pages/home/home.dart';

final routerProvider = Provider((ref) {
  return GoRouter(
    initialLocation: "/${NavigationItem.todo.name}",
    routes: [
      GoRoute(
        name: "home",
        path: "/:nav(${NavigationItem.values.map((e) => e.name).join('|')})",
        pageBuilder: (context, state) {
          final nav = state.params["nav"] ?? NavigationItem.todo.name;
          final listId = state.queryParams["listId"] ?? inbox.id;
          WidgetsBinding.instance.addPostFrameCallback((_) {
            ref.read(listIdProvider.notifier).state = listId;
          });
          return MaterialPage(
            key: state.pageKey,
            child: Home(
              navigationItem:
                  NavigationItem.values.firstWhere((e) => e.name == nav),
            ),
          );
        },
      ),
      GoRoute(
        name: "detail",
        path: "/detail/:taskId",
        pageBuilder: (context, state) {
          final taskId = state.params["taskId"];
          return MaterialPage(
            key: state.pageKey,
            child: Detail(taskId: taskId),
          );
        },
      ),
    ],
  );
});

final listIdProvider = StateProvider((ref) => inbox.id);

String createHomeRoute(int index, String listId) {
  return "/${NavigationItem.values[index].name}?listId=$listId";
}

String createDetailRoute(String taskId) {
  return "/detail/$taskId";
}
