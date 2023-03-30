import 'package:to_do_list_app/data/task_model.dart';

abstract class TaskRepository {
  Future<void> addNewTask(TaskModel newTask);
}
