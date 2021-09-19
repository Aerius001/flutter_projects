import 'package:demotechnixo/data/api/api_todo.dart';
import 'package:demotechnixo/data/models/todo.dart';
import 'package:demotechnixo/domain/reposittories/todo_reposittory.dart';
import 'package:flutter/cupertino.dart';

class HomeViewModel extends ChangeNotifier {
  List<Todo> _todo = [];
  List<Todo> get todo => _todo;

  TodosRepository _taskApi = new TodoApi();

  getTodo() async {
   
    var _response = await _taskApi.getTask();
    var _data = _response.data;
    _todo = List<Todo>.from(_data.map((x) {
      return Todo.fromMap(x);
    }));
    notifyListeners();
  }
}
