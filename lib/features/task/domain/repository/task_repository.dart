import 'package:to_do_list_app/features/task/data/models/task_model.dart';
import 'package:to_do_list_app/features/task/domain/entity/task_entity.dart';

abstract class TaskRepository {
  Future<void> addNewTask(TaskModel newTask);

  TaskEntity getTaskByIndex(int index);
}
