import 'package:flutter/material.dart';
import '../widgets/add_task_widget.dart';
import '../widgets/tasks_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return const AddTask();
                },
              );
            },
            icon: const Icon(Icons.add),
            splashRadius: 20,
          ),
          const SizedBox(
            width: 20,
          )
        ],
        title: const Text(
          'My Tasks',
        ),
      ),
      body: const TasksList(),
    );
  }
}
