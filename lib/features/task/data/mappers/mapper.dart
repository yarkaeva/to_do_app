import 'package:to_do_list_app/features/task/data/models/task_model.dart';
import 'package:to_do_list_app/features/task/domain/entity/task_entity.dart';

class TaskMapper {
  // TODO: Переделать на методы внутри model и entity
  static TaskEntity fromTaskData(TaskModel task) {
    return TaskEntity(
      id: task.id,
      title: task.title,
      dueDate: task.dueDate,
      isDone: task.isDone,
    );
  }
}
