import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_app/features/task/data/repository/task_data_repository.dart';
import 'package:to_do_list_app/features/task/data/state/tasks_list_model.dart';
import 'package:to_do_list_app/features/task/domain/entity/task_entity.dart';

// TODO: почему он вообще здесь а не в стейте?
final _formKey = GlobalKey<FormState>();

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  // TODO: доступ к репо только через контроллер!
  final TaskRepositoryImpl _repo = TaskRepositoryImpl();
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
                // TODO: доступ к репо только через контроллер!

                _repo.addTask(
                  TaskEntity(
                    id: DateTime.now().millisecondsSinceEpoch.toInt(),
                    title: taskTitleInputController.text,
                    dueDate: _selectedDate,
                  ),
                );
                context.read<TasksListModel>().updateTasks();
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
