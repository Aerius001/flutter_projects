import 'package:demotechnixo/presentation/home/test/test_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// file UI
class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  late TestCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = TestCubit();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return _cubit;
      },
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _cubit.increment();
          },
          child: Icon(Icons.add),
        ),
        body: Center(
          child: BlocBuilder<TestCubit, TestState>(
            builder: (context, state) {
              return Text('${state.number}');
            },
            buildWhen: (previous, current) => previous.number != current.number,
          ),
        ),
      ),
    );
  }
}
