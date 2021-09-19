class Todo {
  DateTime? starttime;
  DateTime? endtime;
  String? title;
  String? decription;
  int? id;

  Todo({
    this.starttime,
    this.endtime,
    this.title,
    this.decription,
    this.id,
  });

  factory Todo.fromMap(Map<String, dynamic> map) {
    return Todo(
      starttime: map['starttime'],
      endtime: map['endtime'],
      title: map['title'],
      decription: map['decription'],
      id: map['id'],
    );
  }
}
