import 'package:demotechnixo/presentation/home/add_task.dart';
import 'package:demotechnixo/presentation/home/view/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatefulWidget {
  static const id = 'main_screen';

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late HomeCubit _cubit;

  @override
  void initState() {
    _cubit = HomeCubit();
    super.initState();
    _cubit.getTasks();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return _cubit;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Todo App'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            final result = await Navigator.pushNamed(context, AddTaskScreen.id);

            if (result == true) _cubit.getTasks();
          },
          child: Icon(Icons.add),
        ),
        body: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return ListView.builder(
              itemCount: _cubit.task.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_cubit.task[index].title!), // Edited
                  trailing: PopupMenuButton(
                    onSelected: (i) async {
                      if (i == 0) {
                        final result = await Navigator.pushNamed(
                          context,
                          AddTaskScreen.id,
                          arguments: _cubit.task[index],
                        );
                        if (result == true) _cubit.getTasks();
                      } else if (i == 1) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text('Confirm your deletion'),
                              content: Text(
                                  'This task will be deleted permanently. Do you want to do it?'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text('CANCEL'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    _cubit.deleteTask(_cubit.task[index].id!);
                                    // deleteTask(tasks[index].id!);
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    'DELETE',
                                    style: TextStyle(color: Colors.red),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                    itemBuilder: (context) {
                      return [
                        PopupMenuItem(
                          value: 0,
                          child: Text('Edit'),
                        ),
                        PopupMenuItem(
                          value: 1,
                          child: Text('Delete'),
                        ),
                      ];
                    },
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

// import 'dart:ffi';

// import 'package:demotechnixo/presentation/home/view/home_cubit.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class HomeView extends StatefulWidget {
//   static const id = 'main_screen';

//   const HomeView({Key? key}) : super(key: key);

//   @override
//   _HomeViewState createState() => _HomeViewState();
// }

// class _HomeViewState extends State<HomeView> {
//   late HomeCubit _cubit;

//   @override
//   void initState() {
//     super.initState();
//     _cubit = HomeCubit();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) {
//         return _cubit;
//       },
//       child: Scaffold(
//         floatingActionButton: FloatingActionButton(
//           onPressed: () {
//             int? no = 0;
//             no = no + 1;
//             _cubit.addTask('content', no);
//           },
//           child: Icon(Icons.add),
//         ),
//         body: BlocBuilder<HomeCubit, HomeState>(
//           builder: (context, state) {
//             return ListView.builder(
//               itemCount: state.tasks?.length ?? 0,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   title: Text('${state.tasks?[index]?.task ?? ""}'),
//                   leading: Text('${state.tasks?[index]?.id ?? 0}'),
//                 );
//               },
//             );
//           },
//           buildWhen: (previous, current) => previous.status != current.status,
//         ),
//       ),
//     );
//   }
// }
