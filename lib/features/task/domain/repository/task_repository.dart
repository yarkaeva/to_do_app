import 'package:to_do_list_app/features/task/data/models/task_model.dart';
import 'package:to_do_list_app/features/task/domain/entity/task_entity.dart';

// TODO: написать комменты документирования ///
abstract class TaskRepository {
  // TODO: должен принимать Entity
  Future<void> addNewTask(TaskModel newTask);

  // TODO: Future
  TaskEntity getTaskByIndex(int index);

  // TODO: метод получения списка задач.
}
