import 'package:demotechnixo/data/database/tasks_db.dart';
import 'package:demotechnixo/domain/entities/loadstatus.dart';
import 'package:demotechnixo/domain/entities/task.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'home_state.dart';

// file xử lý logic
class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState());
  List<Task> tasks = [];
  final taskController = TextEditingController();
  bool inSync = false;
  String? taskError;

  Future addTask() async {
    final db = TasksDB();
    final task = Task(
      task: taskController.text.trim(),
    );
    await db.insert(task);
    emit(state.copyWith(tasks: tasks));
  }

  Future deleteTask(int id) async {
    final db = TasksDB();
    await db.delete(id);
    tasks = await db.getTasks();
    await getTasks();
    emit(state.copyWith(tasks: tasks));
  }

  Future getTasks() async {
    final db = TasksDB();
    tasks = await db.getTasks();
    emit(state.copyWith(tasks: tasks));
  }

  Future updateTask(Task task) async {
    final db = TasksDB();
    await db.update(task);
    emit(state.copyWith(tasks: tasks));
  }
}
