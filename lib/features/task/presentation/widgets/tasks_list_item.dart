import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_app/core/extensions/date_time_extensions.dart';
import 'package:to_do_list_app/features/task/data/repository/task_data_repository.dart';
import 'package:to_do_list_app/features/task/data/state/tasks_list_model.dart';
import 'package:to_do_list_app/features/task/domain/entity/task_entity.dart';

class TasksListItem extends StatefulWidget {
  const TasksListItem({
    required this.task,
    super.key,
  });

  final TaskEntity task;

  @override
  State<TasksListItem> createState() => _TasksListItemState();
}

class _TasksListItemState extends State<TasksListItem> {
  final TaskRepositoryImpl _repo = TaskRepositoryImpl();

  @override
  Widget build(BuildContext context) {
    return Consumer<TasksListModel>(
      builder: (context, model, _) => Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: (context) {
                _repo.deleteTask(widget.task.id);
                model.deleteTaskInModel(widget.task);
              },
              icon: Icons.delete,
              backgroundColor: Colors.red.shade300,
              borderRadius: BorderRadius.circular(10),
            ),
          ],
        ),
        child: CheckboxListTile(
          tileColor:
              !widget.task.isDone ? Colors.indigo[100] : Colors.green[300],
          activeColor: Colors.indigo[400],
          value: widget.task.isDone,
          onChanged: (newStatus) {
            if (newStatus != null) {
              _repo.updateTask(newStatus, widget.task);
              model.updateTasks();
            }
          },
          title: Text(
            widget.task.title.trim(),
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  decoration: widget.task.isDone
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
          ),
          subtitle: widget.task.dueDate != null
              ? Text(
                  'крайний срок:  ${widget.task.dueDate!.format}',
                )
              : null,
        ),
      ),
    );
  }
}
