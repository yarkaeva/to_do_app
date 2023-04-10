import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_app/core/extensions/date_time_extensions.dart';
import 'package:to_do_list_app/features/task/domain/entity/task_entity.dart';
import 'package:to_do_list_app/features/task/presentation/controller/tasks_controller.dart';

class TasksListItem extends StatelessWidget {
  const TasksListItem({
    required this.task,
    super.key,
  });

  final TaskEntity task;

  @override
  Widget build(BuildContext context) {
    return Consumer<TasksController>(
      builder: (context, controller, _) => Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: (context) {
                controller.deleteTask(task);
              },
              icon: Icons.delete,
              backgroundColor: Colors.red.shade300,
              borderRadius: BorderRadius.circular(10),
            ),
          ],
        ),
        child: CheckboxListTile(
          tileColor: !task.isDone ? Colors.indigo[100] : Colors.green[300],
          activeColor: Colors.indigo[400],
          value: task.isDone,
          onChanged: (newStatus) {
            if (newStatus != null) {
              controller.toggleTaskStatus(task.id);
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
      ),
    );
  }
}
