import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:to_do_list_app/features/task/data/models/task_model.dart';
import 'package:to_do_list_app/features/task/data/repository/task_data_repository.dart';
import 'package:to_do_list_app/features/task/presentation/widgets/add_task_widget.dart';
import 'package:to_do_list_app/features/task/presentation/widgets/tasks_list_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _showModalBottomSheet(BuildContext context) {
    showModalBottomSheet<Widget>(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return const AddTask();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              _showModalBottomSheet(context);
            },
            icon: const Icon(Icons.add),
            splashRadius: 20,
          ),
          const SizedBox(
            width: 20,
          ),
        ],
        title: const Text(
          'My Tasks',
        ),
      ),
      body: const TasksList(),
    );
  }
}

class TasksList extends StatefulWidget {
  const TasksList({
    super.key,
  });

  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  final TaskDataRepo repo = TaskDataRepo();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box<TaskModel>('tasks').listenable(),
      builder: (context, tasksBox, _) => ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        itemCount: tasksBox.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                TasksListItem(task: repo.getTaskByIndex(index)),
              ],
            );
          } else {
            return TasksListItem(task: repo.getTaskByIndex(index));
          }
        },
        separatorBuilder: (context, index) => const SizedBox(height: 8.0),
      ),
    );
  }
}
