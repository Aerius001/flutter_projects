import 'package:demotechnixo/data/api/api_task.dart';
import 'package:demotechnixo/domain/entities/task.dart';
import 'package:demotechnixo/domain/reposittories/todo_reposittory.dart';
import 'package:flutter/cupertino.dart';

class HomeViewModel extends ChangeNotifier {
  List<Task> _todo = [];
  List<Task> get todo => _todo;

  TaskRepository _taskApi = new TaskApi();

  getTask() async {
    var _response = await _taskApi.getTask();
    var _data = _response.data;
    _todo = List<Task>.from(_data.map((x) {
      return Task.fromMap(x);
    }));
    notifyListeners();
  }
}
