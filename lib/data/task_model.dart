class TaskModel {
  TaskModel({
    required this.id,
    required this.title,
    this.dueDate,
    this.isDone = false,
  });

  String title;
  DateTime? dueDate;
  bool isDone;
  final int id;
}
