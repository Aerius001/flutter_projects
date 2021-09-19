import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../../domain/entities/task.dart';

class TasksDB {
  Database? _database;

  final String kTableName = 'tasks';
  final String kId = 'id';
  final String kTask = 'task';

  // Hàm mở database
  Future _openDB() async {
    _database = await openDatabase(
      join(await getDatabasesPath(), 'tasks.db'),
      onCreate: (db, version) {
        return db.execute(
            'CREATE TABLE $kTableName($kId INTEGER PRIMARY KEY AUTOINCREMENT, $kTask TEXT)');
      },
      version: 1,
    );
  }

  Future insert(Task task) async {
    await _openDB();
    
    await _database!.insert(kTableName, task.toMap());
    print('Task inserted');
  }

  // Hàm cập nhật task
  Future update(Task task) async {
    await _openDB();

    await _database!.update(
      kTableName,
      task.toMap(),
      where: '$kId = ?',
      whereArgs: [task.id],
    );
    print('Task updated');
  }

  Future delete(int id) async {
    await _openDB();
    print((await _database!.delete(
      kTableName,
      where: '$kId = ?',
      whereArgs: [id],
    )));
    print('Task deleted');
  }

  Future<List<Task>> getTasks() async {
    await _openDB();

    List<Map<String, dynamic>> maps = await _database!.query(kTableName);
    return List.generate(
        maps.length,
        (i) => Task(
              id: maps[i][kId],
              task: maps[i][kTask],
            ));
  }
}
