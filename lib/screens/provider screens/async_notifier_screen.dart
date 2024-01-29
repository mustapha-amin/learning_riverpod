import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learning_riverpod/controllers/todo_async_notifier.dart';

class AsyncTodoScreen extends ConsumerStatefulWidget {
  const AsyncTodoScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AsyncTodoScreenState();
}

class _AsyncTodoScreenState extends ConsumerState<AsyncTodoScreen> {
  @override
  Widget build(BuildContext context) {
    final asyncTodos = ref.watch(todosAsyncNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Async Todos"),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          ref.invalidate(todosAsyncNotifierProvider);
        },
        child: SingleChildScrollView(
          child: asyncTodos.when(
            data: (todos) => Column(
              children: [
                ...todos.map(
                  (todo) => ListTile(
                    title: Text(todo.title),
                    trailing: Icon(
                      todo.completed ? Icons.check : Icons.cancel,
                      color: todo.completed ? Colors.green : Colors.red,
                    ),
                  ),
                ),
              ],
            ),
            error: (err, _) => Column(
              children: [
                Text(err.toString()),
                TextButton(
                  onPressed: () {
                    ref.invalidate(todosAsyncNotifierProvider);
                  },
                  child: Text("Retry"),
                )
              ],
            ),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ),
      ),
    );
  }
}
