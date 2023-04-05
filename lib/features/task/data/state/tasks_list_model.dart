import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_list_app/features/task/data/models/task_model.dart';
import 'package:to_do_list_app/features/task/data/repository/task_data_repository.dart';
import 'package:to_do_list_app/features/task/domain/entity/task_entity.dart';

class TasksListModel extends ChangeNotifier {
  final TaskRepositoryImpl _repositoryImpl = TaskRepositoryImpl();
  List<TaskEntity> get tasks => _tasks;
  List<TaskEntity> _tasks = [];

  TasksListModel() {
    updateTasks();
  }

  Future<void> updateTasks() async {
    _tasks = await _repositoryImpl.getTasksList();
    notifyListeners();
    final storage = Hive.box<TaskModel>('tasks');
    unawaited(storage.compact());
    unawaited(storage.close());
  }
}
