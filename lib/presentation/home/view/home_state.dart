part of 'home_cubit.dart';
//file xử lại trạng thái của biến

class HomeState extends Equatable {
  List<Task>? tasks;
  LoadStatus? status;
  HomeState({
    this.tasks,
    this.status = LoadStatus.INITIAL,
  });
  //Tạo ra 1 bản thể giống class cha(TestState) để sau này so sánh giá trị
  HomeState copyWith({
    List<Task>? tasks,
    LoadStatus? status,
  }) {
    return new HomeState(
      tasks: tasks ?? this.tasks,
      status: status ?? this.status,
    );
  }

  @override
  //Để UI lắng nghe được các giá trị thay đổi => cần truyền các biến vào hàm này
  List<dynamic> get props => [
        this.tasks,
        status,
      ];
}
