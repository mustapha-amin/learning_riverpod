import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learning_riverpod/controllers/todo_notifier.dart';
import 'package:learning_riverpod/models/todo.dart';

class NotifierProviderScreen extends ConsumerStatefulWidget {
  const NotifierProviderScreen({super.key});

  @override
  ConsumerState<NotifierProviderScreen> createState() =>
      _NotifierProviderScreenState();
}

class _NotifierProviderScreenState
    extends ConsumerState<NotifierProviderScreen> {
  TextEditingController todoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notifier provider"),
      ),
      body: SingleChildScrollView(
        child: Consumer(
          builder: (context, ref, _) {
            List<Todo> todos = ref.watch(todosNotifierProvider);
            return Column(
              children: [
                ...todos.map(
                  (todo) => Dismissible(
                    key: ValueKey(todo.id),
                    onDismissed: (_) {
                      ref
                          .read(todosNotifierProvider.notifier)
                          .removeTodo(todo.id);
                    },
                    child: CheckboxListTile(
                      value: todo.completed,
                      onChanged: (_) {
                        ref
                            .read(todosNotifierProvider.notifier)
                            .toggleTodo(todo.id);
                      },
                      title: Text(todo.title),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("Add todo"),
                content: TextField(
                  controller: todoController,
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      ref.read(todosNotifierProvider.notifier).addTodo(
                            Todo.withTitle(
                              todoController.text.trim(),
                            ),
                          );
                      todoController.clear();
                      Navigator.of(context).pop();
                    },
                    child: const Text("Add"),
                  )
                ],
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
