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
}