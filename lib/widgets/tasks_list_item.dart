import 'package:flutter/material.dart';
import 'package:to_do_list_app/core/extensions/date_time_extensions.dart';
import 'package:to_do_list_app/data/task_model.dart';

class TasksListItem extends StatefulWidget {
  const TasksListItem({
    required this.task,
    super.key,
  });
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
      tileColor: !isDone ? Colors.indigo[100] : Colors.green[300],
      activeColor: Colors.indigo[400],
      value: isDone,
      onChanged: (newStatus) {
        setState(
          () {
            isDone = newStatus!;
          },
        );
      },
      title: Text(
        widget.task.title,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              decoration:
                  isDone ? TextDecoration.lineThrough : TextDecoration.none,
            ),
      ),
      subtitle: widget.task.dueDate != null
          ? Text(
              'крайний срок:  ${widget.task.dueDate!.format}',
            )
          : null,
    );
  }
}
