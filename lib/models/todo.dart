class Todo {
  Todo({
    required this.id,
    required this.description,
    required this.completed,
  });

  final String id;
  final String description;
  final bool completed;

  Todo copyWith({String? id, String? description, bool? completed}) {
    return Todo(
      id: id ?? this.id,
      description: description ?? this.description,
      completed: completed ?? this.completed,
    );
  }

  factory Todo.withDescription(String? description) {
    return Todo(
      id: DateTime.now().microsecondsSinceEpoch.toString(),
      description: description!,
      completed: false,
    );
  }
}
