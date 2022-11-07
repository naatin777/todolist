import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:todolist/constant.dart';
import 'package:todolist/presentation/pages/detail/detail.dart';
import 'package:todolist/presentation/pages/home/home.dart';
import 'package:todolist/presentation/providers/task_list_navigation_provider.dart';

final routerProvider = Provider((ref) {
  final taskListId = ref.watch(taskListNavigationProvider);
  return GoRouter(
    routes: [
      GoRoute(
        path: "/",
        redirect: (context, state) => "/todo?id=${taskListId.id}",
      ),
      GoRoute(
        name: "home",
        path: "/:screen(${HomeScreen.values.map((e) => e.name).join('|')})",
        pageBuilder: (context, state) {
          final screen = state.params["screen"] ?? HomeScreen.todo.name;
          final homeScreen =
              HomeScreen.values.where((e) => e.name == screen).first;
          final taskListId = state.queryParams["id"] ?? inbox.id;
          return MaterialPage<void>(
            key: state.pageKey,
            child: Home(homeScreen: homeScreen, taskListId: taskListId),
          );
        },
      ),
      GoRoute(
        name: "detail",
        path: "/detail/:id",
        pageBuilder: (context, state) {
          String taskId = state.params["id"] ?? inbox.id;
          return MaterialPage<void>(
            key: state.pageKey,
            child: Detail(
              taskId: taskId,
            ),
          );
        },
      ),
    ],
  );
});
