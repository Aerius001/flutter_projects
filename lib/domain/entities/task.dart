class Task {
  final int? id;
  final String? title;
  Task({this.id, this.title});
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'task': title,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      title: map['title'],
      id: int.parse(map['id']),
    );
  }
}
