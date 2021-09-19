abstract class TaskRepository {
  createTask(String title, );
  updateTask(String title, int id);
  deleteTask(int id);
  Future<dynamic> getTask();
}
