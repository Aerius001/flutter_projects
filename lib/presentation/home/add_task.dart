import 'package:demotechnixo/domain/entities/task.dart';
import 'package:demotechnixo/presentation/home/view/home_cubit.dart';
import 'package:flutter/material.dart';

class AddTaskScreen extends StatefulWidget {
  static const id = 'add_task_screen';

  final Task? task;

  AddTaskScreen(this.task);

  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  late HomeCubit _cubit;

  @override
  void initState() {
    _cubit = HomeCubit();

    Task? task = widget.task;

    if (task != null) {
      _cubit.taskController.text = task.title!;
    }
    super.initState();
  }

  void addTask() async {
    if (_cubit.taskController.text.isEmpty) {
      setState(() {
        _cubit.taskError = 'Please enter this field';
      });
      return null;
    }
    setState(() {
      _cubit.taskError = null;
      _cubit.inSync = true;
    });
    setState(() {
      _cubit.inSync = false;
    });
  }

  void updateTask() async {
    if (_cubit.taskController.text.isEmpty) {
      setState(() {
        _cubit.taskError = 'Please enter this field';
      });
      return null;
    }
    setState(() {
      _cubit.taskError = null;
      _cubit.inSync = true;
    });
    setState(() {
      _cubit.inSync = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.task == null ? 'Add Task' : 'Edit Task'),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: !_cubit.inSync
              ? () {
                  Navigator.pop(context);
                }
              : null,
        ),
        actions: <Widget>[
          !_cubit.inSync
              ? IconButton(
                  icon: Icon(Icons.done),
                  onPressed: () {
                    widget.task == null
                        ? _cubit.addTask(_cubit.taskController.text.trim())
                        : _cubit.updateTask(
                            Task(
                              id: widget.task!.id,
                              title: _cubit.taskController.text.trim(),
                            ),
                          );
                    Navigator.pop(context, true);
                  },
                )
              : Icon(Icons.refresh),
        ],
        elevation: 0.0,
        textTheme: TextTheme(
          title: Theme.of(context).textTheme.title,
        ),
        iconTheme: IconThemeData(
          color: Colors.black87,
        ),
      ),
      body: WillPopScope(
        onWillPop: () async {
          if (!_cubit.inSync) return true;
          return false;
        },
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: TextField(
            controller: _cubit.taskController,
            decoration: InputDecoration(
              labelText: 'Task',
              errorText: _cubit.taskError,
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ),
    );
  }
}
