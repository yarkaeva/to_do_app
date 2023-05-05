import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list_app/core/extensions/date_time_extensions.dart';
import 'package:to_do_list_app/features/task/domain/entity/task_entity.dart';
import 'package:to_do_list_app/features/task/presentation/bloc/tasks_bloc.dart';

class TasksListItem extends StatelessWidget {
  const TasksListItem({
    required this.task,
    super.key,
  });

  final TaskEntity task;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      background: Container(
        color: Colors.red.shade300,
      ),
      onDismissed: (direction) {
        BlocProvider.of<TasksBloc>(context).add(TaskDeleted(task));
      },
      confirmDismiss: (directoin) {
        return showDialog<bool>(
          context: context,
          builder: (_) => AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            title: const Text('Confirm'),
            content: const Text('Are you sure you wish to delete this task?'),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, true);
                },
                child: const Text('Yes'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context, false);
                },
                child: const Text('No'),
              ),
            ],
          ),
        );
      },
      key: Key('${task.id}'),
      child: CheckboxListTile(
        tileColor: !task.isDone ? Colors.indigo[100] : Colors.green[300],
        activeColor: Colors.indigo[400],
        value: task.isDone,
        onChanged: (newStatus) {
          if (newStatus != null) {
            BlocProvider.of<TasksBloc>(context).add(TaskToggled(task.id));
          }
        },
        title: Text(
          task.title.trim(),
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                decoration: task.isDone
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
              ),
        ),
        subtitle: task.dueDate != null
            ? Text(
                'крайний срок:  ${task.dueDate!.format}',
              )
            : null,
      ),
    );
  }
}
