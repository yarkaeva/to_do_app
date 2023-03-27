import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:to_do_list_app/data/task_model.dart';
import 'package:to_do_list_app/widgets/add_task_widget.dart';
import 'package:to_do_list_app/widgets/tasks_list_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<void> addNewTaskToTasksList(TaskModel newTask) async {
    // if (!Hive.isAdapterRegistered(0)) {
    //   Hive.registerAdapter(TaskModelAdapter());
    // }
    await Hive.box<TaskModel>('tasks').add(newTask);
  }

  void _showModalBottomSheet() {
    showModalBottomSheet<Widget>(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return AddTask(
          addNewTaskToTasksList: addNewTaskToTasksList,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: _showModalBottomSheet,
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
      body: ValueListenableBuilder(
        valueListenable: Hive.box<TaskModel>('tasks').listenable(),
        builder: (context, tasksBox, _) {
          return ListView.separated(
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
                    TasksListItem(task: tasksBox.get(index)!),
                  ],
                );
              } else {
                return TasksListItem(task: tasksBox.get(index)!);
              }
            },
            separatorBuilder: (context, index) => const SizedBox(height: 8.0),
          );
        },
      ),
    );
  }
}
