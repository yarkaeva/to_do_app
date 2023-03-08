import 'package:flutter/material.dart';
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
              Navigator.of(context).pushNamed('/add_task');
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
