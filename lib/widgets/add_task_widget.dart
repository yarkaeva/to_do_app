import 'package:flutter/material.dart';
import 'package:to_do_list_app/data/task_model.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  DateTime _selectedDate = DateTime.now();

  final taskTitleInputController = TextEditingController();
  final dateInputController = TextEditingController();

  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime(2030),
    ).then((value) {
      setState(() {
        _selectedDate = value!;
        dateInputController.text = _selectedDate.toString();
      });
    });
  }

  void createNewTask() {
    TaskModel newTask = TaskModel(
        id: 51, title: taskTitleInputController.text, dueDate: _selectedDate);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 30, bottom: 20, left: 20, right: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Введите название задачи',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Colors.indigo[600],
            ),
          ),
          TextFormField(
            controller: taskTitleInputController,
            style: TextStyle(fontSize: 16, color: Colors.indigo[600]),
          ),
          const SizedBox(height: 25),
          Text(
            'Выберите срок выполнения задачи',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Colors.indigo[600],
            ),
          ),
          TextFormField(
            controller: dateInputController,
            style: TextStyle(fontSize: 16, color: Colors.indigo[600]),
            onTap: _showDatePicker,
          ),
          const SizedBox(height: 25),
          ElevatedButton(
            onPressed: () {
              createNewTask();
              Navigator.pop(context);
            }, // createNewTask,
            style: ButtonStyle(
              textStyle: const MaterialStatePropertyAll(
                TextStyle(fontSize: 16),
              ),
              backgroundColor: MaterialStatePropertyAll(Colors.indigo[300]),
              shape: MaterialStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            child: const Text('Создать задачу'),
          ),
        ],
      ),
    );
  }
}
