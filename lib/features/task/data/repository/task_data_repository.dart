import 'dart:async';
import 'package:hive/hive.dart';
import 'package:to_do_list_app/features/task/data/models/task_model.dart';
import 'package:to_do_list_app/features/task/domain/entity/task_entity.dart';
import 'package:to_do_list_app/features/task/domain/repository/task_repository.dart';

class TaskRepositoryImpl extends TaskRepository {
  @override
  Future<void> addTask(TaskEntity newTask) async {
    final storage = await Hive.openBox<TaskModel>('tasks');
    await storage.put(newTask.id, newTask.toModel());
  }

  @override
  Future<List<TaskEntity>> getTasksList() async {
    final storage = await Hive.openBox<TaskModel>('tasks');
    final tasksList = storage.values.map((task) => task.toEntity()).toList();
    unawaited(storage.close());
    return tasksList;
  }

  @override
  Future<void> deleteTask(int id) async {
    final storage = await Hive.openBox<TaskModel>('tasks');
    await storage.delete(id);
    unawaited(storage.close());
  }

  @override
  Future<void> toggleTaskStatus(int id) async {
    final storage = await Hive.openBox<TaskModel>('tasks');
    final task = storage.get(id);
    if (task != null) {
      final updatedTask = task.copyWith(isDone: !task.isDone);
      await storage.put(id, updatedTask);
    }
    unawaited(storage.close());
  }
}
