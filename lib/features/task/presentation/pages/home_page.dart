import 'package:flutter/material.dart';
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
  final TaskRepositoryImpl repo = TaskRepositoryImpl();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: repo.getTasksList(),
      builder: (context, snapshot) => snapshot.hasData
          ? ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              itemCount: snapshot.data!.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      TasksListItem(task: snapshot.data![index]),
                    ],
                  );
                } else {
                  return TasksListItem(task: snapshot.data![index]);
                }
              },
              separatorBuilder: (context, index) => const SizedBox(height: 8.0),
            )
          : const Center(
              child: CircularProgressIndicator.adaptive(),
            ),
    );
  }
}
