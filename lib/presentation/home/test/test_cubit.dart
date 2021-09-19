import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'test_state.dart';

// file xử lý logic
class TestCubit extends Cubit<TestState> {
  TestCubit() : super(TestState());

  void increment() {
    int temp;
    temp = state.number;
    temp = temp + 1;
    emit(state.copyWith(number: temp));
  }
}
