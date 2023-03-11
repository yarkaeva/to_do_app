import 'package:flutter/material.dart';
import 'package:to_do_list_app/data/data.dart';
import 'package:to_do_list_app/data/task_model.dart';

import '../pages/home_page.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  DateTime? _selectedDate = DateTime.now();

  final taskTitleInputController = TextEditingController();
  final dateInputController = TextEditingController();

  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: _selectedDate == null ? DateTime.now() : _selectedDate!,
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    ).then((value) {
      setState(() {
        _selectedDate = value;
        if (_selectedDate == null) {
          dateInputController.clear();
        } else {
          dateInputController.text = _selectedDate.toString();
        }
      });
    });
  }

  void newTaskModel() {
    TaskModel newTask = TaskModel(
      id: DateTime.now().millisecondsSinceEpoch.toInt(),
      title: taskTitleInputController.text,
      dueDate: _selectedDate,
    );
    ;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, bottom: 20, left: 20, right: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Введите название задачи',
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(color: Colors.indigo[600]),
          ),
          TextFormField(
            controller: taskTitleInputController,
            decoration: const InputDecoration(
              hintText: 'Название задачи',
            ),
            style: TextStyle(fontSize: 16, color: Colors.indigo[600]),
          ),
          const SizedBox(height: 25),
          Text(
            'Выберите срок выполнения задачи',
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(color: Colors.indigo[600]),
          ),
          TextFormField(
            readOnly: true,
            controller: dateInputController,
            style: TextStyle(fontSize: 16, color: Colors.indigo[600]),
            onTap: _showDatePicker,
            decoration: const InputDecoration(
              hintText: 'Крайний срок',
            ),
          ),
          const SizedBox(height: 25),
          ElevatedButton(
            onPressed: () {
              newTaskModel;
              Navigator.pop(context);
            },
            child: const Text('Создать задачу'),
          ),
        ],
      ),
    );
  }
}
