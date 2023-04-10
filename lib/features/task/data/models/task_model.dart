import 'package:hive_flutter/adapters.dart';
import 'package:to_do_list_app/features/task/domain/entity/task_entity.dart';
part 'task_model.g.dart';

@HiveType(typeId: 0)
class TaskModel {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final DateTime? dueDate;

  @HiveField(3)
  final bool isDone;

  TaskModel({
    required this.id,
    required this.title,
    this.dueDate,
    this.isDone = false,
  });

  TaskEntity toEntity() => TaskEntity(
        id: id,
        title: title,
        dueDate: dueDate,
        isDone: isDone,
      );

  TaskModel copyWith({
    int? id,
    String? title,
    DateTime? dueDate,
    bool? isDone,
  }) {
    return TaskModel(
      id: id ?? this.id,
      title: title ?? this.title,
      dueDate: dueDate ?? this.dueDate,
      isDone: isDone ?? this.isDone,
    );
  }
}
