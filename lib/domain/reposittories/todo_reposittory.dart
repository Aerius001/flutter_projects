abstract class TodosRepository {
  createTask(DateTime starttime, DateTime endtime, String title,
      String decription, int id);
  updateTask(DateTime starttime, DateTime endtime, String title,
      String decription, int id);
  deleteTask(int id);
  Future<dynamic> getTask();
}
