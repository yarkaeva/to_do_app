import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:to_do_list_app/data/task_model.dart';

final _formKey = GlobalKey<FormState>();

class AddTask extends StatefulWidget {
  const AddTask({required this.addNewTaskToTasksList, super.key});
  final void Function(TaskModel newTask) addNewTaskToTasksList;

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  DateTime? _selectedDate;

  final taskTitleInputController = TextEditingController();
  final dateInputController = TextEditingController();

  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: _selectedDate == null ? DateTime.now() : _selectedDate!,
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    ).then(
      (value) {
        setState(
          () {
            if (value != null) _selectedDate = value;
            dateInputController.text =
                DateFormat('dd. MM. yy').format(_selectedDate!);
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 30,
        horizontal: 20,
      ),
      child: Form(
        key: _formKey,
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
              validator: (value) {
                value = value?.replaceAll(' ', '');
                if (value == null || value.isEmpty) {
                  return 'Название задачи не может быть пустым';
                }
                return null;
              },
              decoration: const InputDecoration(
                hintText: 'Название задачи',
              ),
              style: Theme.of(context)
                  .textTheme
                  .titleSmall
                  ?.copyWith(color: Colors.indigo[600]),
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
              style: Theme.of(context)
                  .textTheme
                  .titleSmall
                  ?.copyWith(color: Colors.indigo[600]),
              onTap: _showDatePicker,
              decoration: InputDecoration(
                hintText: 'Крайний срок',
                suffixIcon: IconButton(
                  splashRadius: 20,
                  onPressed: () {
                    _selectedDate = null;
                    dateInputController.clear();
                  },
                  icon: Icon(
                    Icons.clear,
                    color: Theme.of(context).iconTheme.color,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 25),
            ElevatedButton(
              onPressed: () {
                if (!_formKey.currentState!.validate()) {
                  return;
                }
                widget.addNewTaskToTasksList(
                  TaskModel(
                    id: DateTime.now().millisecondsSinceEpoch.toInt(),
                    title: taskTitleInputController.text,
                    dueDate: _selectedDate,
                  ),
                );
                Navigator.pop(context);
              },
              child: const Text('Создать задачу'),
            ),
            SizedBox(
              height: MediaQuery.of(context).viewInsets.bottom,
            ),
          ],
        ),
      ),
    );
  }
}
