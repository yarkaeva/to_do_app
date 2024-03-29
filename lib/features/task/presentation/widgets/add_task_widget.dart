import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_app/features/task/domain/entity/task_entity.dart';
import 'package:to_do_list_app/features/task/presentation/controller/tasks_controller.dart';



class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  final _formKey = GlobalKey<FormState>();
  DateTime? _selectedDate;

  final taskTitleInputController = TextEditingController();
  final dateInputController = TextEditingController();

  String? _validator(String? value) {
    final valueWithoutSpaces = value?.replaceAll(' ', '');
    if (valueWithoutSpaces == null || valueWithoutSpaces.isEmpty) {
      return 'Название задачи не может быть пустым';
    }
    return null;
  }

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
            if (value != null) {
              _selectedDate = value;
              dateInputController.text =
                  DateFormat('dd. MM. yy').format(_selectedDate!);
            }
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
              validator: _validator,
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
              style: Theme.of(context).textTheme.titleSmall,
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
                context.read<TasksController>().addTask(
                      TaskEntity(
                        id: DateTime.now().millisecondsSinceEpoch ~/ 10000,
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
