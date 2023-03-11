import 'package:flutter/material.dart';
import 'package:to_do_list_app/data/task_model.dart';

import '../widgets/add_task_widget.dart';
import '../widgets/tasks_list_item.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key, required this.newData});
  List<TaskModel> newData;

  void createNewTask(TaskModel newTask) {
    newData.insert(0, newTask);
  }

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _showModalBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
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
            onPressed: _showModalBottomSheet,
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
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        itemCount: widget.newData.length,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                TasksListItem(task: widget.newData[index]),
              ],
            );
          } else {
            return TasksListItem(task: widget.newData[index]);
          }
        },
        separatorBuilder: (BuildContext context, index) =>
            const SizedBox(height: 8.0),
      ),
    );
  }
}
