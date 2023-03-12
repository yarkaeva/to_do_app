import 'package:flutter/material.dart';
import 'package:to_do_list_app/data/task_model.dart';
import 'package:to_do_list_app/widgets/add_task_widget.dart';
import 'package:to_do_list_app/widgets/tasks_list_item.dart';

class HomePage extends StatefulWidget {
  HomePage({required this.newData, super.key});
  List<TaskModel> newData;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void addNewTaskToTasksList(TaskModel newTask) {
    widget.newData.insert(0, newTask);
    setState(() {});
  }

  void _showModalBottomSheet() {
    showModalBottomSheet<Widget>(
      context: context,
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
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        itemCount: widget.newData.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
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
        separatorBuilder: (context, index) => const SizedBox(height: 8.0),
      ),
    );
  }
}
