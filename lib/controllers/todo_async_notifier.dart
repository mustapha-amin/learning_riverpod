import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learning_riverpod/models/todo.dart';
import 'package:dio/dio.dart';

final todosAsyncNotifierProvider =
    AsyncNotifierProvider<AsyncTodoNotifier, List<Todo>>(
  AsyncTodoNotifier.new,
);

class AsyncTodoNotifier extends AsyncNotifier<List<Todo>> {
  Future<List<Todo>> _fetchTodo() async {
    final completer = Completer<List<Todo>>();
    final todosResponse =
        await Dio().get('https://jsonplaceholder.typicode.com/todos');
    if (todosResponse.statusCode == 200) {
      final data = todosResponse.data as List<dynamic>;
      List<Todo> todosFromJson = data.map((e) => Todo.fromJson(e)).toList();
      completer.complete(todosFromJson);
    } else {
      completer.completeError('An error occured error');
    }
    return completer.future;
  }

  @override
  Future<List<Todo>> build() async {
    return _fetchTodo();
  }
}
