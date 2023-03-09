import 'package:flutter/material.dart';
import '../data/task_model.dart';

class TasksListItem extends StatefulWidget {
  const TasksListItem({super.key, required this.task});
  final TaskModel task;

  @override
  State<TasksListItem> createState() => _TasksListItemState();
}

class _TasksListItemState extends State<TasksListItem> {
  late bool isDone;

  @override
  void initState() {
    super.initState();
    isDone = widget.task.isDone;
  }

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      tileColor: isDone == false ? Colors.indigo[100] : Colors.green[300],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      activeColor: Colors.indigo[400],
      checkboxShape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      value: isDone,
      onChanged: (bool? newStatus) {
        setState(() {
          isDone = newStatus!;
        });
      },
      title: Text(
        widget.task.title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          decoration:
              isDone == true ? TextDecoration.lineThrough : TextDecoration.none,
        ),
      ),
      subtitle: widget.task.dueDate != null
          ? Text(
              'дедлайн:  ${widget.task.dueDate} ',
            )
          : null,
    );
  }
}
