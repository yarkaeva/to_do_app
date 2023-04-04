import 'package:to_do_list_app/features/task/domain/entity/task_entity.dart';

abstract class TaskRepository {
  ///Adding a task to DataBase.
  Future<void> addTask(TaskEntity newTask);

  ///Get a list of tasks from DataBase.
  Future<List<TaskEntity>> getTasksList();
}
