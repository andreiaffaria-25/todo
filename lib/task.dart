class Task {
  String id;
  String title;
  bool isDone;

  Task({required this.id, required this.title, this.isDone = false});

  Map<String, dynamic> toMap() => {'title': title, 'isDone': isDone};

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(id: map['id'], title: map['title'], isDone: map['isDone'] ?? false);
  }
}