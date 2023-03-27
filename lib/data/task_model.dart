import 'package:hive_flutter/adapters.dart';

part 'task_model.g.dart';

@HiveType(typeId: 0)
class TaskModel extends HiveObject {
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
}
