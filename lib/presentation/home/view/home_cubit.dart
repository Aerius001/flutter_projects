import 'package:demotechnixo/data/api/api_task.dart';
import 'package:demotechnixo/domain/entities/loadstatus.dart';
import 'package:demotechnixo/domain/entities/task.dart';
import 'package:demotechnixo/domain/reposittories/todo_reposittory.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'home_state.dart';

// file xử lý logic
class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState());
  List<Task> task = [];
  TaskRepository _taskApi = new TaskApi();
  final taskController = TextEditingController();
  bool inSync = false;
  String? taskError;

  Future addTask(title) async {
    var _response = await _taskApi.createTask(title);
    var _data = _response.data;
    getTasks();
  }

  Future deleteTask(int id) async {
    var _response = await _taskApi.deleteTask(id);
    var _data = _response.data;
    getTasks();
  }

  Future getTasks() async {
    var _response = await _taskApi.getTask();
    var _data = _response.data;
    task = List<Task>.from(_data.map((x) {
      return Task.fromMap(x);
    }));
    
    emit(state.copyWith(tasks: task));
    // emit(state.tasks= task)
  }

  Future updateTask(Task task) async {
    var _response = await _taskApi.updateTask(task.title!, task.id!);
    var _data = _response.data;
    getTasks();
  }
}
