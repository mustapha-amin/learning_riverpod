import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/todo.dart';

final todosNotifierProvider = NotifierProvider<TodoNotifier, List<Todo>>(
  TodoNotifier.new,
);

class TodoNotifier extends Notifier<List<Todo>> {
  @override
  build() {
    return [];
  }

  void addTodo(Todo todo) {
    state = [...state, todo];
  }

  void removeTodo(String id) {
    state = state.where((todo) => todo.id != id).toList();
  }

  void toggleTodo(String id) {
    state = state
        .map((e) => e.id == id ? e.copyWith(completed: !e.completed) : e)
        .toList();
  }
}
