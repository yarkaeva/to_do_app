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
    isDone = widget.task.isDone;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      tileColor: isDone == false ? Colors.indigo[100] : Colors.green[300],
      activeColor: Colors.indigo[400],
      value: isDone,
      onChanged: (bool? newStatus) {
        setState(() {
          isDone = newStatus!;
        });
      },
      title: Text(widget.task.title,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                decoration: isDone == true
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
              )),
      subtitle: widget.task.dueDate != null
          ? Text(
              'дедлайн:  ${widget.task.dueDate} ',
            )
          : null,
    );
  }
}
