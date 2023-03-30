import 'package:to_do_list_app/data/task_model.dart';
import 'package:to_do_list_app/domain/entity/task_entity.dart';

class TaskMapper {
  static TaskEntity fromTaskData(TaskModel task) {
    return TaskEntity(
      id: task.id,
      title: task.title,
      dueDate: task.dueDate,
      isDone: task.isDone,
    );
  }
}
