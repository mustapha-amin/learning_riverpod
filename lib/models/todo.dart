class Todo {
  Todo({
    required this.id,
    required this.title,
    required this.completed,
  });

  final int id;
  final String title;
  final bool completed;

  Todo copyWith({int? id, String? title, bool? completed}) {
    return Todo(
      id: id ?? this.id,
      title: title ?? this.title,
      completed: completed ?? this.completed,
    );
  }

  factory Todo.withTitle(String? title) {
    return Todo(
      id: DateTime.now().microsecondsSinceEpoch,
      title: title!,
      completed: false,
    );
  }

  factory Todo.fromJson(Map<String, dynamic> map) {
    return Todo(
      id: map['id'],
      title: map['title'],
      completed: map['completed'],
    );
  }
}
