import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Добавить задачу'),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Введите название задачи',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.indigo[600],
                ),
              ),
              TextFormField(
                onEditingComplete: () {
                  setState(() {});
                },
                controller: taskTitleInputController,
                style: TextStyle(fontSize: 16, color: Colors.indigo[600]),
              ),
              const SizedBox(height: 25),
              Text(
                'Выберите срок выполнения задачи',
                style: TextStyle(
                  fontSize: 18,
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
                onPressed: () {}, // createNewTask,
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
              Text(
                  'Результат манипуляций: ${taskTitleInputController.text} $_selectedDate')
            ],
          ),
        ));
  }
}
