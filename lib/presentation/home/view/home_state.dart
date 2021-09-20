part of 'home_cubit.dart';
//file xử lại trạng thái của biến

class HomeState extends Equatable {
  List<Task>? tasks;
  HomeState({
    this.tasks,
  });
  //Tạo ra 1 bản thể giống class cha(TestState) để sau này so sánh giá trị
  HomeState copyWith({
    List<Task>? tasks,
   
  }) {
    return new HomeState(
      tasks: tasks ?? this.tasks,
    );
  }

  @override
  //Để UI lắng nghe được các giá trị thay đổi => cần truyền các biến vào hàm này
  List<dynamic> get props => [
        this.tasks,
      ];
}
