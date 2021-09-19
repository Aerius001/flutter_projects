import 'package:demotechnixo/domain/entities/task.dart';
import 'package:demotechnixo/presentation/home/add_task.dart';
import 'package:demotechnixo/presentation/home/view/home_view.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeView.id,
      routes: {
        HomeView.id: (_) => HomeView(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == AddTaskScreen.id) {
          return MaterialPageRoute(
            builder: (context) {
              if (settings.arguments != null) {
                Task? task = settings.arguments as Task?;
                return AddTaskScreen(task);
              }

              return AddTaskScreen(null);
            },
          );
        }
        return null;
      },
    );
  }
}
