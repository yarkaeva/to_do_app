import 'package:to_do_list_app/data/task_model.dart';
import 'package:to_do_list_app/domain/entity/task_entity.dart';

abstract class TaskRepository {
  Future<void> addNewTask(TaskModel newTask);
  TaskEntity getTaskByIndex(int index);
}
