import 'dart:async';
import 'package:flutter/material.dart';
import 'package:to_do_list_app/features/task/data/repository/task_data_repository.dart';
import 'package:to_do_list_app/features/task/domain/entity/task_entity.dart';

class TasksController extends ChangeNotifier {
  final TaskRepositoryImpl _repositoryImpl;

  List<TaskEntity> get tasks => _tasks;
  List<TaskEntity> _tasks = [];

  TasksController(this._repositoryImpl) {
    loadTasks();
  }

  Future<void> loadTasks() async {
    _tasks = await _repositoryImpl.getTasksList();
    _sorting(_tasks);
    notifyListeners();
  }

  Future<void> addTask(TaskEntity newTask) async {
    await _repositoryImpl.addTask(newTask);

    if (newTask.dueDate == null) {
      _tasks.insert(0, newTask);
    } else {
      _tasks.add(newTask);
      _sorting(_tasks);
    }
    notifyListeners();
  }

  Future<void> deleteTask(TaskEntity task) async {
    await _repositoryImpl.deleteTask(task.id);
    _tasks.remove(task);
    notifyListeners();
  }

  Future<void> toggleTaskStatus(int id) async {
    await _repositoryImpl.toggleTaskStatus(id);
    final index = _tasks.indexWhere((element) => element.id == id);
    final task = _tasks[index];
    _tasks
      ..add(task.copyWith(isDone: !task.isDone))
      ..removeAt(index);

    if (task.isDone == true) {
      _sorting(_tasks);
    }

    notifyListeners();
  }

  void _sorting(List<TaskEntity> list) {
    list
      ..sort(_dateSort)
      ..sort(_statusSort);
  }
}

int _dateSort(TaskEntity a, TaskEntity b) {
  final isDoneA = a.dueDate;
  final isDoneB = b.dueDate;
  return isDoneA == null
      ? -1
      : isDoneB == null
          ? 1
          : isDoneA.compareTo(isDoneB);
}

int _statusSort(TaskEntity a, TaskEntity b) {
  return a.isDone == b.isDone ? 0 : (a.isDone ? 1 : -1);
}
