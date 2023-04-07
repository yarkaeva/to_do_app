import 'package:to_do_list_app/features/task/domain/entity/task_entity.dart';

abstract class TaskRepository {
  ///Adding a task to DataBase.
  Future<void> addTask(TaskEntity newTask);

  ///Get a list of tasks from DataBase.
  Future<List<TaskEntity>> getTasksList();

  ///Delete a task from DataBase.
  Future<void> deleteTask(int id);

  ///Update isDone status of task in DataBase.
  Future<void> updateTask(bool newStatus, TaskEntity task);
}
