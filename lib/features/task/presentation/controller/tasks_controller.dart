import 'dart:async';
import 'package:flutter/material.dart';
import 'package:to_do_list_app/features/task/domain/entity/task_entity.dart';
import 'package:to_do_list_app/features/task/domain/repository/task_repository.dart';

class TasksController extends ChangeNotifier {
  final TaskRepository _repositoryImpl;

  List<TaskEntity> get tasks => _tasks;
  List<TaskEntity> _tasks = [];

  TasksController(this._repositoryImpl) {
    loadTasks();
  }

  Future<void> loadTasks() async {
    _tasks = await _repositoryImpl.getTasksList();
    notifyListeners();
  }

  Future<void> addTask(TaskEntity newTask) async {
    await _repositoryImpl.addTask(newTask);
    _tasks.add(newTask);
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
    _tasks[index] = task.copyWith(isDone: !task.isDone);

    notifyListeners();
  }
}
