part of 'test_cubit.dart';
//file xử lại trạng thái của biến
class TestState extends Equatable {
  int number;
  TestState({
    this.number = 0,
  });
  //Tạo ra 1 bản thể giống class cha(TestState) để sau này so sánh giá trị 
  TestState copyWith({
    int? number,
  }) {
    return new TestState(
      number: number ?? this.number,
    );
  }

  @override
  //Để UI lắng nghe được các giá trị thay đổi => cần truyền các biến vào hàm này
  List<Object> get props => [
        this.number,
      ];
}