import 'package:to_do_list_app/features/task/data/models/task_model.dart';

// TODO: Equatable.
class TaskEntity {
  final int id;
  final String title;
  final DateTime? dueDate;
  final bool isDone;

  TaskEntity({
    required this.id,
    required this.title,
    this.dueDate,
    this.isDone = false,
  });

  TaskModel toModel() => TaskModel(
        id: id,
        title: title,
        dueDate: dueDate,
        isDone: isDone,
      );
}
