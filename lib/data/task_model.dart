class TaskModel {
  const TaskModel({
    required this.id,
    required this.title,
    this.dueDate,
    this.isDone = false,
  });

  final String title;
  final DateTime? dueDate;
  final bool isDone;
  final int id;
}
