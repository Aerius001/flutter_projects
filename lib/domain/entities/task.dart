class Task {
  final int? id;
  final String? task;
  Task({this.id, this.task});
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'task': task,
    };
  }
}
